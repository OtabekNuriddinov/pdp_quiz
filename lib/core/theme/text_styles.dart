import 'package:flutter/material.dart';
import 'colors.dart';

sealed class AppTextStyles {
  static TextStyle helloStyle = TextStyle(
    color: AppColors.black,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 30,
  );

  static TextStyle welcomeStyle = TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
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

  static TextStyle createAcc = TextStyle(
      fontSize: 20,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      color: Colors.black);

  static TextStyle helpStyle = TextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle labelStyle = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle acceptStyle = TextStyle(
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: AppColors.grey100);

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle techItemName = TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
}
