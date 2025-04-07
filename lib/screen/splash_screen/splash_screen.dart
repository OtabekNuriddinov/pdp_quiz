import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/config/routes.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'package:pdp_quiz/core/theme/icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _verticalAnimation;
  late Animation<double> _horizontalAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    Future.delayed(Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.signIn);
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    // Responsive o'lchamlar
    final logoWidth = width * 0.6;
    final logoHeight = height * 0.1;
    final centerX = (width - logoWidth) / 2;
    final centerY = (height - logoHeight) / 2;
    final verticalDistance = height * 0.35;
    final horizontalDistance = width * 0.25;

    /// Animatsiyalarni endi build ichida yaratamiz
    _opacityAnimation = TweenSequence([
      TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 75),
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 0.0), weight: 25),
    ]).animate(_animationController);

    _verticalAnimation = TweenSequence([
      TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 50),
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.0, end: verticalDistance), weight: 25),
      TweenSequenceItem(tween: ConstantTween<double>(verticalDistance), weight: 25),
    ]).animate(_animationController);

    _horizontalAnimation = TweenSequence([
      TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 75),
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.0, end: horizontalDistance), weight: 25),
    ]).animate(_animationController);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, ch) {
          return Stack(
            children: [
              Positioned(
                left: centerX + _horizontalAnimation.value,
                top: centerY - _verticalAnimation.value,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: SizedBox(
                    width: logoWidth,
                    height: logoHeight,
                    child: Center(
                      child: AppIcons.pdp,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
