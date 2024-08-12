import 'package:extinct/domain/animal/animal.dart';
import 'package:extinct/presentation/animal/animal_view.dart';
import 'package:extinct/presentation/animal/animal_view_title.dart';
import 'package:extinct/presentation/chat/chat_page.dart';
import 'package:extinct/presentation/home/home_menu_drawer.dart';
import 'package:extinct/presentation/home/page_view_indicator.dart';
import 'package:extinct/presentation/home/slider/bucardo_bg.dart';
import 'package:extinct/presentation/home/slider/dodo_bg.dart';
import 'package:extinct/presentation/home/slider/pigeon_bg.dart';
import 'package:extinct/presentation/home/slider/quagga_bg.dart';
import 'package:extinct/presentation/home/slider/thylacine_bg.dart';
import 'package:extinct/presentation/home/slider/tortoise_bg.dart';
import 'package:extinct/presentation/home/talk_to_me_button.dart';
import 'package:extinct/presentation/widgets/app_bar_leading_button/app_bar_leading_button.dart';
import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:page_transition/page_transition.dart';

const kBackgroundLargeAnimation = Duration(milliseconds: 300);
const kBackgroundAnimation = Duration(milliseconds: 200);

final animals = <Animal>[
  Animal(name: 'Dodo', key: 'dodo', extinctYear: 1567),
  Animal(name: 'Thylacine', key: 'thylacine', extinctYear: 1936),
  Animal(name: 'Quagga', key: 'quagga', extinctYear: 1883),
  Animal(name: 'Passenger Pigeon', key: 'pigeon', extinctYear: 1914),
  Animal(name: 'Pinta Gian Tortoise', key: 'tortoise', extinctYear: 2012),
  Animal(name: 'Bucardo', key: 'bucardo', extinctYear: 2000),
];

class HomePage extends StatefulWidget {
  final int initialPage;

  const HomePage({super.key, this.initialPage = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageViewController;
  final ValueNotifier<int> _currentPageIndexNotifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: widget.initialPage);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateCurrentPage();
    });
    _pageViewController.addListener(_updateCurrentPage);
  }

  @override
  void dispose() {
    _pageViewController.removeListener(_updateCurrentPage);
    _currentPageIndexNotifier.dispose();
    super.dispose();
  }

  void _updateCurrentPage() {
    _currentPageIndexNotifier.value = _pageViewController.page?.round() ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: AppBarLeadingButton(
              icon: Icons.menu,
              onTap: () {
                showCupertinoModalBottomSheet(
                  context: context,
                  builder: (context) => HomeMenuDrawer(animals: animals),
                );
              },
            ),
          ),
          extendBodyBehindAppBar: true,
          body: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy < -8) {
                _navigateToChat();
              }
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: ValueListenableBuilder<int>(
                    builder: (context, index, _) {
                      switch (animals[index].key) {
                        case 'dodo':
                          return const DodoBg();
                        case 'thylacine':
                          return const ThylacineBg();
                        case 'quagga':
                          return const QuaggaBg();
                        case 'pigeon':
                          return const PigeonBg();
                        case 'tortoise':
                          return const TortoiseBg();
                        case 'bucardo':
                          return const BucardoBg();
                        default:
                          return const SizedBox();
                      }
                    },
                    valueListenable: _currentPageIndexNotifier,
                  ),
                ),
                PageView(
                  key: const PageStorageKey<String>('customKeyName'),
                  controller: _pageViewController,
                  children: animals.map((e) => AnimalView(animal: e)).toList(),
                  onPageChanged: (_) {
                    Haptics.vibrate(HapticsType.heavy);
                  },
                ),
                Positioned(
                  bottom: MediaQuery.of(context).padding.bottom,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      AnimalViewTitle(
                        currentPageIndexNotifier: _currentPageIndexNotifier,
                        animals: animals,
                      ),
                      const SizedBox(height: 32),
                      PageViewIndicator(
                        controller: _pageViewController,
                        currentPageIndexNotifier: _currentPageIndexNotifier,
                        pageViewLength: animals.length,
                      ),
                      const SizedBox(height: 32),
                      InkWell(
                        onTap: _navigateToChat,
                        child: const TalkToMeButton(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToChat() {
    final pageIndex = _pageViewController.page!.round();
    Navigator.of(context).push(
      PageTransition(
        child: ChatPage(
          animal: animals[pageIndex],
        ),
        childCurrent: HomePage(initialPage: pageIndex),
        type: PageTransitionType.bottomToTopJoined,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ),
    );
  }
}
