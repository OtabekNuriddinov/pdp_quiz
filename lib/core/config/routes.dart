import 'package:flutter/material.dart';
import 'package:pdp_quiz/screen/confirmation/confirmation.dart';
import 'package:pdp_quiz/screen/sign_in/sign_in.dart';
import 'package:pdp_quiz/screen/sign_up/sign_up.dart';
import 'package:pdp_quiz/screen/splash_screen/splash_screen.dart';

sealed class AppRoutes{
  static final splash = 'splash';
  static final signIn = 'signIn';
  static final signUp = 'signUp';
  static final confirmation = 'confirm';

  static Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    AppRoutes.splash: (context)=>const SplashScreen(),
    AppRoutes.signIn: (context)=>const SignIn(),
    AppRoutes.signUp: (context)=>const SignUp(),
    AppRoutes.confirmation: (context)=> const Confirmation()
  };
}