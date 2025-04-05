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


    _opacityAnimation = TweenSequence([
      TweenSequenceItem(
        tween: ConstantTween<double>(1.0),
        weight: 75,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.0),
        weight: 25,
      )
    ]).animate(_animationController);

    /// vertical uchun
    _verticalAnimation = TweenSequence([
      TweenSequenceItem(
        tween: ConstantTween<double>(0.0),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 300.0),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(300.0),
        weight: 25,
      )
    ]).animate(_animationController);

    /// o'nga harakat uchun
    _horizontalAnimation = TweenSequence([
      TweenSequenceItem(
        tween: ConstantTween<double>(0.0),
        weight: 75,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 100),
        weight: 25,
      )
    ]).animate(_animationController);

    Future.delayed(
      Duration(seconds: 4),
      () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.signIn);
        }
      },
    );
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
    return Scaffold(
      backgroundColor: AppColors.white,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, ch) {
          final centerX = (width - 245)/2;
          final centerY = (height-78)/2;
          return Stack(
            children: [
              Positioned(
                left: centerX + _horizontalAnimation.value,
                top: centerY - _verticalAnimation.value,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: Container(
                      width: 245,
                      height: 78,
                      child: Center(
                        child: AppIcons.pdp,
                      ),
                    ),
                ),
              ),
          ]
          );
        },
      ),
    );
  }
}
