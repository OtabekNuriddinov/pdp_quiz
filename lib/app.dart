import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/config/routes.dart';

class PdpQuiz extends StatelessWidget {
  const PdpQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.signIn,
      routes: AppRoutes.routes,
    );
  }
}
