import 'package:extinct/domain/animal/animal.dart';
import 'package:extinct/presentation/about/about_page.dart';
import 'package:extinct/presentation/chat/chat_page.dart';
import 'package:extinct/presentation/settings/settings_page.dart';
import 'package:extinct/presentation/widgets/app_bar_leading_button/app_bar_leading_button.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeMenuDrawer extends StatelessWidget {
  final List<Animal> animals;

  const HomeMenuDrawer({
    super.key,
    required this.animals,
  });

  @override
  Widget build(BuildContext context) {
    const listTileTitleStyle = TextStyle(fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: AppBarLeadingButton(
          icon: Icons.close,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 64),
            Flexible(child: _AnimalsGrid(animals)),
            Flexible(
              child: Column(
                children: [
                  // ListTile(
                  //   leading: const Icon(Icons.settings),
                  //   title: const Text(
                  //     'Settings',
                  //     style: listTileTitleStyle,
                  //   ),
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (_) => const SettingsPage()));
                  //   },
                  // ),
                  // const Divider(),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text(
                      'About of this app',
                      style: listTileTitleStyle,
                    ),
                    onTap: () {
                      showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) => const AboutPage(),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text(
                      'Rate this app',
                      style: listTileTitleStyle,
                    ),
                    onTap: () async {
                      final InAppReview inAppReview = InAppReview.instance;

                      if (await inAppReview.isAvailable()) {
                        inAppReview.requestReview();
                      }
                    },
                  ),
                  const SizedBox(height: 32),
                  const Text(
                      'This app was developed for Gemini API Competition. © 2024')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AnimalsGrid extends StatelessWidget {
  final List<Animal> animals;

  const _AnimalsGrid(this.animals);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
      ),
      itemBuilder: (context, i) {
        return InkWell(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: AssetImage(
                    'assets/avatar/${animals[i].key}_avatar.png'),
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  animal: animals[i],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
