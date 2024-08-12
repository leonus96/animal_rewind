import 'package:extinct/application/theme/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppThemeMode>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: themeMode.brightness == Brightness.dark,
              onChanged: (value) {
                themeMode.brightness =
                    value ? Brightness.dark : Brightness.light;
              },
            ),
          )
        ],
      ),
    );
  }
}
