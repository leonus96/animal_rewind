import 'package:extinct/application/theme/theme.dart';
import 'package:extinct/application/theme/theme_mode.dart';
import 'package:extinct/application/theme/theme_util.dart';
import 'package:extinct/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const primaryColor = Color(0x00FEDDBE);

class ExtinctApp extends StatelessWidget {
  const ExtinctApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme =
        createTextTheme(context, "Montserrat", "Merriweather");
    MaterialTheme theme = MaterialTheme(textTheme);

    final themeMode = AppThemeMode(context);
    return ChangeNotifierProvider<AppThemeMode>.value(
      value: themeMode,
      child: Consumer<AppThemeMode>(
        builder: (_, themeMode, __) {
          return MaterialApp(
            title: 'Extinct',
            theme: theme.light(),
            debugShowCheckedModeBanner: false,
            // theme: themeMode.brightness == Brightness.light
            //     ? theme.light()
            //     : theme.dark(),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

