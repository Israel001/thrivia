import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thrivia_app/ui/common/app_colors.dart';

abstract class AppTheme {
  static final textTheme = TextTheme(
    bodyLarge: GoogleFonts.onest(),
    bodyMedium: GoogleFonts.onest(),
    bodySmall: GoogleFonts.onest(),
  );

  static final lightColorScheme = ColorScheme.light(
    primary: AppColors.white,
    onPrimary: AppColors.black,
    // primary: AppColors.k_272816C,
  );
  static final darkColorScheme = ColorScheme.dark(
    primary: AppColors.black,
    onPrimary: AppColors.white,
    // primary: AppColors.k_272816C,
  );

  static final lightTheme = ThemeData.from(
          colorScheme: lightColorScheme,
          textTheme: textTheme,
          useMaterial3: true)
      .copyWith(
          scaffoldBackgroundColor: AppColors.white,
          elevatedButtonTheme: elevatedButtonTheme);

  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.k_272816C,
          minimumSize: Size(double.infinity, 44),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.50,
              color: AppColors.k_7FE7E7E7,
            ),
            borderRadius: BorderRadius.circular(50),
          )));

  static final darkTheme = ThemeData.from(
          colorScheme: darkColorScheme,
          textTheme: textTheme,
          useMaterial3: true)
      .copyWith(
          elevatedButtonTheme: elevatedButtonTheme,
          scaffoldBackgroundColor: AppColors.k_1c2027);
}
