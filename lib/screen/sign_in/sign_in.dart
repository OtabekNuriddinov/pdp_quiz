import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/config/routes.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'package:pdp_quiz/core/theme/dimens.dart';
import 'package:pdp_quiz/core/theme/strings.dart';
import '../../core/widgets/main_elevated_button.dart';
import '../../core/widgets/main_textfield.dart';
import '../../core/widgets/or_sign_in_with.dart';
import '/core/theme/icons.dart';
import '/core/theme/text_styles.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
  final int itemCount = 8;
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      itemCount,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      ),
    );

    _animations = _controllers.map((controller) {
      return Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
          .animate(controller);
    }).toList();
    _runStaggeredAnimations();
  }

  void _runStaggeredAnimations() async {
    for (int i = _controllers.length - 1; i >= 0; i--) {
      await Future.delayed(Duration(milliseconds: 100));
      _controllers[i].forward();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.08,
            horizontal: width * 0.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideTransition(
                position: _animations[0],
                child: SizedBox(
                  width: width * 0.5,
                  height: height * 0.08,
                  child: AppIcons.pdp,
                ),
              ),
              SizedBox(height: height * 0.05),
              SlideTransition(
                position: _animations[1],
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.hello, style: AppTextStyles.helloStyle),
                ),
              ),
              SlideTransition(
                position: _animations[2],
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.welcome,
                      style: AppTextStyles.welcomeStyle),
                ),
              ),
              SizedBox(height: height * 0.06),
              SlideTransition(
                position: _animations[3],
                child: SizedBox(
                  height: height * 0.08,
                  child: MainTextField(
                    label: AppStrings.phone,
                    hint: "+998",
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              SlideTransition(
                position: _animations[4],
                child: SizedBox(
                  height: height * 0.07,
                  width: double.infinity,
                  child: MainElevatedButton(
                    text: "Sign In",
                    onTapped: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.signUp);
                    },
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              SlideTransition(
                position: _animations[5],
                child: OrSignInWith(),
              ),
              SizedBox(height: height * 0.03),
              SlideTransition(
                position: _animations[6],
                child: SizedBox(
                  width: width * 0.13,
                  height: width * 0.13,
                  child: Material(
                    color: AppColors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: AppIcons.googleBut,
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              SlideTransition(
                position: _animations[7],
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: AppStrings.dHAccount,
                          style: AppTextStyles.dHAnAccount),
                      TextSpan(
                        text: " Sign Up",
                        style: AppTextStyles.signInOut,
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
