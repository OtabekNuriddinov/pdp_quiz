import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/config/routes.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'package:pdp_quiz/core/theme/dimens.dart';
import 'package:pdp_quiz/core/theme/strings.dart';
import 'package:pdp_quiz/core/theme/text_styles.dart';
import 'package:pdp_quiz/core/widgets/main_elevated_button.dart';
import 'package:pdp_quiz/core/widgets/main_textfield.dart';
import 'package:pdp_quiz/core/widgets/or_sign_in_with.dart';
import 'package:pdp_quiz/screen/sign_in_sms/sign_in_sms.dart';

import '../../core/theme/icons.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  final int itemCount = 10;
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _animations;
  bool val = false;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      itemCount,
      (index) {
        return AnimationController(
            vsync: this, duration: Duration(milliseconds: 500));
      },
    );
    _animations = _controllers.map((controller) {
      return Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
          .animate(controller);
    }).toList();
    _staggeredAnimation();
  }

  void _staggeredAnimation() async {
    for (int i = _controllers.length - 1; i >= 0; i--) {
      await Future.delayed(Duration(milliseconds: 100));
      _controllers[i].forward();
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].dispose();
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
            vertical: height * 0.05,
            horizontal: width * 0.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideTransition(
                position: _animations[0],
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Create an account", style: AppTextStyles.createAcc),
                ),
              ),
              SlideTransition(
                position: _animations[1],
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.help,
                    style: AppTextStyles.helpStyle,
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              SlideTransition(
                position: _animations[2],
                child: MainTextField(
                  label: AppStrings.firstName,
                  hint: AppStrings.enterFirst,
                ),
              ),
              SizedBox(height: height * 0.04),
              SlideTransition(
                position: _animations[3],
                child: MainTextField(
                  label: AppStrings.lastName,
                  hint: AppStrings.enterLast,
                ),
              ),
              SizedBox(height: height * 0.04),
              SlideTransition(
                position: _animations[4],
                child: MainTextField(
                  label: AppStrings.phone,
                  hint: "+998",
                ),
              ),
              SizedBox(height: height * 0.03),
              SlideTransition(
                position: _animations[5],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      checkColor: AppColors.white,
                      activeColor: AppColors.green,
                      value: val,
                      onChanged: (value) {
                        setState(() {
                          val = value!;
                        });
                      },
                    ),
                    Flexible(
                      child: Text(
                        AppStrings.acceptTerms,
                        style: AppTextStyles.acceptStyle,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              SlideTransition(
                position: _animations[6],
                child: SizedBox(
                  height: height * 0.07,
                  width: double.infinity,
                  child: MainElevatedButton(
                    text: AppStrings.signUp,
                    onTapped: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.keypad,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: height * 0.025),
              SlideTransition(
                position: _animations[7],
                child: OrSignInWith(),
              ),

              SizedBox(height: height * 0.025),
              SlideTransition(
                position: _animations[8],
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
                position: _animations[9],
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Don't have an account?",
                          style: AppTextStyles.dHAnAccount),
                      TextSpan(
                          text: " Sign In",
                          style: AppTextStyles.signInOut,
                          recognizer: TapGestureRecognizer()..onTap = () {}),
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
