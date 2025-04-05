import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'package:pdp_quiz/core/theme/dimens.dart';
import 'package:pdp_quiz/core/theme/strings.dart';
import 'package:pdp_quiz/core/theme/text_styles.dart';
import 'package:pdp_quiz/core/widgets/main_elevated_button.dart';
import 'package:pdp_quiz/core/widgets/main_textfield.dart';
import 'package:pdp_quiz/core/widgets/or_sign_in_with.dart';

import '../../core/theme/icons.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 26, horizontal: 40),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text("Create an account", style: AppTextStyles.createAcc),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.help,
                      style: AppTextStyles.helpStyle,
                    ),
                  ),
                  AppDimens.s36,
                  MainTextField(
                    label: AppStrings.firstName,
                    hint: AppStrings.enterFirst,
                  ),
                  AppDimens.s36,
                  MainTextField(
                    label: AppStrings.lastName,
                    hint: AppStrings.enterLast,
                  ),
                  AppDimens.s36,
                  MainTextField(
                    label: AppStrings.phone,
                    hint: "+998",
                  ),
                  AppDimens.s24,
                  Row(
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
                      Text(
                        AppStrings.acceptTerms,
                        style: AppTextStyles.acceptStyle,
                      ),
                    ],
                  ),
                  AppDimens.s24,
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: MainElevatedButton(
                      text: AppStrings.signUp,
                      onTapped: (){

                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  OrSignInWith(),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 55,
                    height: 55,
                    child: Material(
                      color: AppColors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: AppIcons.googleBut,
                    ),
                  ),
                  SizedBox(height: 36),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Don't have an account?",
                            style: AppTextStyles.dHAnAccount
                        ),
                        TextSpan(
                            text: " Sign In",
                            style: AppTextStyles.signInOut,
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){
                              }
                        )
                      ],
                    ),
                  )
                ],
              ),

          ),
        ),

    );
  }
}
