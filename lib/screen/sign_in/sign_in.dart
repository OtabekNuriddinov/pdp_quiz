import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'package:pdp_quiz/core/theme/dimens.dart';
import '../../core/widgets/main_elevated_button.dart';
import '../../core/widgets/main_textfield.dart';
import '../../core/widgets/or_sign_in_with.dart';
import '/core/theme/icons.dart';
import '/core/theme/text_styles.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 70),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 205,
              height: 65,
              child: AppIcons.pdp,
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Hello,", style: AppTextStyles.helloStyle),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("You Are Welcome", style: AppTextStyles.welcomeStyle),
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 66,
              child: MainTextField(
                label: "Phone Number",
                hint: "+998",
              ),
            ),
            AppDimens.s24,
            SizedBox(
              height: 60,
              width: double.infinity,
              child: MainElevatedButton(
                text: "Sign In",
              ),
            ),
            AppDimens.s24,
            OrSignInWith(),
            AppDimens.s24,
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
            SizedBox(height: 40),
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
    ));
  }
}
