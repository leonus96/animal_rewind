import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff87521b),
      surfaceTint: Color(0xff87521b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdcc0),
      onPrimaryContainer: Color(0xff2d1600),
      secondary: Color(0xff735943),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdcc0),
      onSecondaryContainer: Color(0xff291706),
      tertiary: Color(0xff5a6238),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffdee8b2),
      onTertiaryContainer: Color(0xff181e00),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff221a14),
      onSurfaceVariant: Color(0xff51443a),
      outline: Color(0xff837469),
      outlineVariant: Color(0xffd5c3b6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372f28),
      inversePrimary: Color(0xffffb877),
      primaryFixed: Color(0xffffdcc0),
      onPrimaryFixed: Color(0xff2d1600),
      primaryFixedDim: Color(0xffffb877),
      onPrimaryFixedVariant: Color(0xff6b3b03),
      secondaryFixed: Color(0xffffdcc0),
      onSecondaryFixed: Color(0xff291706),
      secondaryFixedDim: Color(0xffe2c0a5),
      onSecondaryFixedVariant: Color(0xff5a422d),
      tertiaryFixed: Color(0xffdee8b2),
      onTertiaryFixed: Color(0xff181e00),
      tertiaryFixedDim: Color(0xffc2cb98),
      onTertiaryFixedVariant: Color(0xff434a23),
      surfaceDim: Color(0xffe6d7cd),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e8),
      surfaceContainer: Color(0xfffbebe1),
      surfaceContainerHigh: Color(0xfff5e5db),
      surfaceContainerHighest: Color(0xffefe0d5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff663700),
      surfaceTint: Color(0xff87521b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa1682f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff553e2a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8b6f58),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3f461f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff70794c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff221a14),
      onSurfaceVariant: Color(0xff4d4037),
      outline: Color(0xff6a5c52),
      outlineVariant: Color(0xff87786c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372f28),
      inversePrimary: Color(0xffffb877),
      primaryFixed: Color(0xffa1682f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff845019),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff8b6f58),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff715741),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff70794c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff586036),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe6d7cd),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e8),
      surfaceContainer: Color(0xfffbebe1),
      surfaceContainerHigh: Color(0xfff5e5db),
      surfaceContainerHighest: Color(0xffefe0d5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff371b00),
      surfaceTint: Color(0xff87521b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff663700),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff311e0c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff553e2a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1e2503),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3f461f),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff2c2219),
      outline: Color(0xff4d4037),
      outlineVariant: Color(0xff4d4037),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372f28),
      inversePrimary: Color(0xffffe8d7),
      primaryFixed: Color(0xff663700),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff462400),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff553e2a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3d2815),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3f461f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff29300b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe6d7cd),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e8),
      surfaceContainer: Color(0xfffbebe1),
      surfaceContainerHigh: Color(0xfff5e5db),
      surfaceContainerHighest: Color(0xffefe0d5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb877),
      surfaceTint: Color(0xffffb877),
      onPrimary: Color(0xff4b2700),
      primaryContainer: Color(0xff6b3b03),
      onPrimaryContainer: Color(0xffffdcc0),
      secondary: Color(0xffe2c0a5),
      onSecondary: Color(0xff412c19),
      secondaryContainer: Color(0xff5a422d),
      onSecondaryContainer: Color(0xffffdcc0),
      tertiary: Color(0xffc2cb98),
      onTertiary: Color(0xff2c340e),
      tertiaryContainer: Color(0xff434a23),
      onTertiaryContainer: Color(0xffdee8b2),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff19120c),
      onSurface: Color(0xffefe0d5),
      onSurfaceVariant: Color(0xffd5c3b6),
      outline: Color(0xff9e8e82),
      outlineVariant: Color(0xff51443a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefe0d5),
      inversePrimary: Color(0xff87521b),
      primaryFixed: Color(0xffffdcc0),
      onPrimaryFixed: Color(0xff2d1600),
      primaryFixedDim: Color(0xffffb877),
      onPrimaryFixedVariant: Color(0xff6b3b03),
      secondaryFixed: Color(0xffffdcc0),
      onSecondaryFixed: Color(0xff291706),
      secondaryFixedDim: Color(0xffe2c0a5),
      onSecondaryFixedVariant: Color(0xff5a422d),
      tertiaryFixed: Color(0xffdee8b2),
      onTertiaryFixed: Color(0xff181e00),
      tertiaryFixedDim: Color(0xffc2cb98),
      onTertiaryFixedVariant: Color(0xff434a23),
      surfaceDim: Color(0xff19120c),
      surfaceBright: Color(0xff413730),
      surfaceContainerLowest: Color(0xff130d07),
      surfaceContainerLow: Color(0xff221a14),
      surfaceContainer: Color(0xff261e18),
      surfaceContainerHigh: Color(0xff312822),
      surfaceContainerHighest: Color(0xff3c332c),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffbd83),
      surfaceTint: Color(0xffffb877),
      onPrimary: Color(0xff261100),
      primaryContainer: Color(0xffc28348),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe7c4a9),
      onSecondary: Color(0xff231203),
      secondaryContainer: Color(0xffa98b72),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffc7d09c),
      onTertiary: Color(0xff131900),
      tertiaryContainer: Color(0xff8c9566),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff19120c),
      onSurface: Color(0xfffffaf8),
      onSurfaceVariant: Color(0xffdac7ba),
      outline: Color(0xffb1a093),
      outlineVariant: Color(0xff908074),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefe0d5),
      inversePrimary: Color(0xff6c3c04),
      primaryFixed: Color(0xffffdcc0),
      onPrimaryFixed: Color(0xff1f0d00),
      primaryFixedDim: Color(0xffffb877),
      onPrimaryFixedVariant: Color(0xff542c00),
      secondaryFixed: Color(0xffffdcc0),
      onSecondaryFixed: Color(0xff1d0d01),
      secondaryFixedDim: Color(0xffe2c0a5),
      onSecondaryFixedVariant: Color(0xff47321e),
      tertiaryFixed: Color(0xffdee8b2),
      onTertiaryFixed: Color(0xff0e1300),
      tertiaryFixedDim: Color(0xffc2cb98),
      onTertiaryFixedVariant: Color(0xff323914),
      surfaceDim: Color(0xff19120c),
      surfaceBright: Color(0xff413730),
      surfaceContainerLowest: Color(0xff130d07),
      surfaceContainerLow: Color(0xff221a14),
      surfaceContainer: Color(0xff261e18),
      surfaceContainerHigh: Color(0xff312822),
      surfaceContainerHighest: Color(0xff3c332c),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaf8),
      surfaceTint: Color(0xffffb877),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffbd83),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe7c4a9),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff8ffd1),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc7d09c),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff19120c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffffaf8),
      outline: Color(0xffdac7ba),
      outlineVariant: Color(0xffdac7ba),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefe0d5),
      inversePrimary: Color(0xff422200),
      primaryFixed: Color(0xffffe1cb),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffbd83),
      onPrimaryFixedVariant: Color(0xff261100),
      secondaryFixed: Color(0xffffe1cb),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe7c4a9),
      onSecondaryFixedVariant: Color(0xff231203),
      tertiaryFixed: Color(0xffe3ecb6),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc7d09c),
      onTertiaryFixedVariant: Color(0xff131900),
      surfaceDim: Color(0xff19120c),
      surfaceBright: Color(0xff413730),
      surfaceContainerLowest: Color(0xff130d07),
      surfaceContainerLow: Color(0xff221a14),
      surfaceContainer: Color(0xff261e18),
      surfaceContainerHigh: Color(0xff312822),
      surfaceContainerHighest: Color(0xff3c332c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
