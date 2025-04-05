import 'package:flutter/material.dart';
import 'colors.dart';

sealed class AppTextStyles{
  static TextStyle helloStyle = TextStyle(color: AppColors.black,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 30,
  );

  static TextStyle welcomeStyle = TextStyle(
      fontSize: 24,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400
  );

  static TextStyle dHAnAccount = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.black,
  );
  static TextStyle signInOut = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.green,
  );
}