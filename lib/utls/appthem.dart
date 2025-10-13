import 'package:evently_app/utls/App_Styles.dart';
import 'package:evently_app/utls/appcolors.dart';
import 'package:evently_app/utls/appimages.dart';
import 'package:flutter/material.dart';


class AppTheme {
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.PrimaryColordark,
    hintColor: AppColors.Primarycolorlight,
    focusColor: AppColors.Primarycolorlight,
      canvasColor: AppColors.PrimaryColordark,
    scaffoldBackgroundColor: AppColors.PrimaryColordark,
    textTheme:  TextTheme(
      displayLarge: AppStyles.med16white,
        headlineLarge: AppStyles.bold20white,
        headlineMedium: AppStyles.med16white,
        bodyMedium: AppStyles.bold16primaryDark,
        bodyLarge: AppStyles.bold16white,
        bodySmall: AppStyles.med16white

    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.Primarycolorlight,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.PrimaryColordark,
             shape:StadiumBorder(
      side: BorderSide(color: AppColors.white,width: 4)
  ),

        // RoundedRectangleBorder(
            //     side: BorderSide(color: AppColors.white,width: 4),
            //     borderRadius:BorderRadius.circular(30))

      )
  );
  static ThemeData lightTheme = ThemeData(
      hintColor: AppColors.grey,
      focusColor: AppColors.white,
      canvasColor: AppColors.white,
      primaryColor: AppColors.Primarycolorlight,
      scaffoldBackgroundColor: AppColors.white,
      textTheme:  TextTheme(
          displayLarge: AppStyles.medium16black,
      headlineLarge: AppStyles.bold20black,
          headlineMedium: AppStyles.med16primary,
          bodyMedium: AppStyles.bold16white,
        bodyLarge: AppStyles.bold16primaryDark,
          bodySmall: AppStyles.medium16black
  ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(

        backgroundColor: AppColors.Primarycolorlight,
        type: BottomNavigationBarType.fixed,

        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.Primarycolorlight,
      shape:StadiumBorder(
        side: BorderSide(color: AppColors.white,width: 4)
      ),

        // RoundedRectangleBorder(
      //     side: BorderSide(color: AppColors.white,width: 4),
      //     borderRadius:BorderRadius.circular(30))
  )
  );
}
