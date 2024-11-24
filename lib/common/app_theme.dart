import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thrivia_app/common/app_colors.dart';

abstract class AppTheme {
  static final textTheme = TextTheme(
    bodyLarge: GoogleFonts.onest(),
    bodyMedium: GoogleFonts.onest(),
    bodySmall: GoogleFonts.onest(),
  );

  static final lightColorScheme = ColorScheme.light(
    surface: AppColors.white,
    primary: AppColors.white,
    onPrimary: AppColors.black,
    // primary: AppColors.k_272816C,
  );
  static final darkColorScheme = ColorScheme.dark(
    surface: AppColors.k_1c2027,
    primary: AppColors.black,
    onPrimary: AppColors.white,
    // primary: AppColors.k_272816C,
  );
  static ThemeData get darkTheme => _appTheme(darkColorScheme);
  static ThemeData get lightTheme => _appTheme(lightColorScheme);

  static ThemeData _appTheme(ColorScheme colorScheme) {
    return ThemeData.from(
            colorScheme: colorScheme, textTheme: textTheme, useMaterial3: true)
        .copyWith(
            elevatedButtonTheme: elevatedButtonTheme,
            dividerTheme:
                DividerThemeData(thickness: 0.5, color: Color(0xFF939090)),
            appBarTheme: AppBarTheme(
                backgroundColor: colorScheme.primary, centerTitle: true),
            inputDecorationTheme: inputDecorationTheme,
            textSelectionTheme: TextSelectionThemeData().copyWith(
              cursorColor: colorScheme.onPrimary,
              selectionHandleColor: colorScheme.onPrimary,
            ),
            iconTheme: IconThemeData(size: 16, color: Colors.white));
  }

  // static final lightTheme = ThemeData.from(
  //         colorScheme: lightColorScheme,
  //         textTheme: textTheme,
  //         useMaterial3: true)
  //     .copyWith(
  //         scaffoldBackgroundColor: AppColors.white,
  //         elevatedButtonTheme: elevatedButtonTheme,
  //         inputDecorationTheme: InputDecorationTheme());

// static AppBarTheme appBarTheme = AppBarTheme(
//   backgroundColor:
// );
  static InputDecorationTheme inputDecorationTheme =
      InputDecorationTheme().copyWith(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    floatingLabelStyle: textTheme.bodySmall!.copyWith(color: Color(0xFF939090)),
    hintStyle: textTheme.bodySmall!.copyWith(color: Color(0xFF939090)),
    labelStyle: textTheme.bodyMedium,

    // labelStyle: ,
    contentPadding: EdgeInsets.zero,
    border: InputBorder.none,
    errorBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
  );

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
}
