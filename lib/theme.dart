import "package:flutter/material.dart";
import "package:solar_icons/solar_icons.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00687c),
      surfaceTint: Color(0xff00687c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb0ecff),
      onPrimaryContainer: Color(0xff004e5e),
      secondary: Color(0xff4b6269),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcee7ef),
      onSecondaryContainer: Color(0xff344a51),
      tertiary: Color(0xff585c7e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffdee0ff),
      onTertiaryContainer: Color(0xff404565),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff5fafd),
      onSurface: Color(0xff171c1e),
      onSurfaceVariant: Color(0xff40484b),
      outline: Color(0xff70787c),
      outlineVariant: Color(0xffbfc8cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3133),
      inversePrimary: Color(0xff85d1e8),
      primaryFixed: Color(0xffb0ecff),
      onPrimaryFixed: Color(0xff001f27),
      primaryFixedDim: Color(0xff85d1e8),
      onPrimaryFixedVariant: Color(0xff004e5e),
      secondaryFixed: Color(0xffcee7ef),
      onSecondaryFixed: Color(0xff061f25),
      secondaryFixedDim: Color(0xffb2cbd3),
      onSecondaryFixedVariant: Color(0xff344a51),
      tertiaryFixed: Color(0xffdee0ff),
      onTertiaryFixed: Color(0xff141937),
      tertiaryFixedDim: Color(0xffc0c4eb),
      onTertiaryFixedVariant: Color(0xff404565),
      surfaceDim: Color(0xffd6dbdd),
      surfaceBright: Color(0xfff5fafd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff4f7),
      surfaceContainer: Color(0xffe9eff1),
      surfaceContainerHigh: Color(0xffe4e9eb),
      surfaceContainerHighest: Color(0xffdee3e6),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff85d1e8),
      surfaceTint: Color(0xff85d1e8),
      onPrimary: Color(0xff003641),
      primaryContainer: Color(0xff004e5e),
      onPrimaryContainer: Color(0xffb0ecff),
      secondary: Color(0xffb2cbd3),
      onSecondary: Color(0xff1d343a),
      secondaryContainer: Color(0xff344a51),
      onSecondaryContainer: Color(0xffcee7ef),
      tertiary: Color(0xffc0c4eb),
      onTertiary: Color(0xff292e4d),
      tertiaryContainer: Color(0xff404565),
      onTertiaryContainer: Color(0xffdee0ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1416),
      onSurface: Color(0xffdee3e6),
      onSurfaceVariant: Color(0xffbfc8cb),
      outline: Color(0xff899295),
      outlineVariant: Color(0xff40484b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e6),
      inversePrimary: Color(0xff00687c),
      primaryFixed: Color(0xffb0ecff),
      onPrimaryFixed: Color(0xff001f27),
      primaryFixedDim: Color(0xff85d1e8),
      onPrimaryFixedVariant: Color(0xff004e5e),
      secondaryFixed: Color(0xffcee7ef),
      onSecondaryFixed: Color(0xff061f25),
      secondaryFixedDim: Color(0xffb2cbd3),
      onSecondaryFixedVariant: Color(0xff344a51),
      tertiaryFixed: Color(0xffdee0ff),
      onTertiaryFixed: Color(0xff141937),
      tertiaryFixedDim: Color(0xffc0c4eb),
      onTertiaryFixedVariant: Color(0xff404565),
      surfaceDim: Color(0xff0f1416),
      surfaceBright: Color(0xff343a3c),
      surfaceContainerLowest: Color(0xff090f11),
      surfaceContainerLow: Color(0xff171c1e),
      surfaceContainer: Color(0xff1b2022),
      surfaceContainerHigh: Color(0xff252b2d),
      surfaceContainerHighest: Color(0xff303638),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
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
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (context) => const Icon(
        SolarIconsOutline.altArrowLeft, // Change your icon here
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      isDense: true,
      prefixIconColor: colorScheme.onSurface,
      suffixIconColor: colorScheme.onSurface,
      fillColor: colorScheme.surfaceContainerHighest,
      prefixIconConstraints: BoxConstraints(minWidth: 38.0, minHeight: 24.0),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: colorScheme.error, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: colorScheme.onSurfaceVariant, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: colorScheme.error, width: 1.0),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 8.0,
      ),
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    ),
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
