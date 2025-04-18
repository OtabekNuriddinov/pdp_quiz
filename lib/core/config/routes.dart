import 'package:flutter/material.dart';
import 'package:pdp_quiz/screen/category_page/category_page.dart';
import 'package:pdp_quiz/screen/flutter_page/flutter_page.dart';
import 'package:pdp_quiz/screen/home_page/home_page.dart';
import 'package:pdp_quiz/screen/page_eight/page_eight.dart';
import 'package:pdp_quiz/screen/profile_screen/profile_screen.dart';
import 'package:pdp_quiz/screen/result_page/result_screen.dart';
import 'package:pdp_quiz/screen/sign_in/sign_in.dart';
import 'package:pdp_quiz/screen/sign_in_sms/sign_in_sms.dart';
import 'package:pdp_quiz/screen/sign_up/sign_up.dart';
import 'package:pdp_quiz/screen/splash_screen/splash_screen.dart';
import 'package:pdp_quiz/screen/steps_screen/basic_screen.dart';
import 'package:pdp_quiz/screen/users/users_page.dart';

sealed class AppRoutes{
  static const splash = 'splash';
  static const signIn = 'signIn';
  static const signUp = 'signUp';
  static const keypad = 'keypad';
  static const home = 'home';
  static const flutter = 'flutter';
  static const profile = 'profile';
  static const eight = 'eight';
  static const level = 'level';
  static const category = 'category';
  static const result = 'result';
  static const usersPage = 'usersPage';


  static Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    AppRoutes.splash: (context)=>const SplashScreen(),
    AppRoutes.signIn: (context)=>const SignIn(),
    AppRoutes.signUp: (context)=>const SignUp(),
    AppRoutes.keypad: (context)=>const PDPKeypadScreen(),
    AppRoutes.home : (context)=>const HomeScreen(),
    AppRoutes.flutter : (context)=>const FlutterPage(),
    AppRoutes.profile : (context)=>const ProfileScreen(),
    AppRoutes.eight : (context)=>const EightPage(),
    AppRoutes.level : (context)=>const LevelScreen(),
    AppRoutes.category : (context)=>const CategoryPage(),
    AppRoutes.usersPage : (context)=>const UsersPage(),
    AppRoutes.result : (context)=>const ResultPage(),

  };
}