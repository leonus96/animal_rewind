import 'package:extinct/presentation/widgets/app_bar_leading_button/app_bar_leading_button.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ResourceImageViewPage extends StatelessWidget {
  final String path;

  const ResourceImageViewPage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarLeadingButton(
          icon: Icons.arrow_back,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: PhotoView(
        imageProvider: AssetImage(path),
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
