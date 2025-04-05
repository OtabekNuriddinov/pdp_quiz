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

class _SignUpState extends State<SignUp> with TickerProviderStateMixin{

  final int itemCount = 10;
  late List<AnimationController>_controllers;
  late List<Animation<Offset>> _animations;
  bool val = false;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
        itemCount,
      (index){
          return AnimationController(
            vsync: this,
            duration: Duration(milliseconds: 500)
          );
      },
    );
    _animations = _controllers.map((controller){
      return Tween<Offset>(
        begin: Offset(0, -1),
        end: Offset(0, 0)
      ).animate(controller);
    } ).toList();
    _staggeredAnimation();
  }

  void _staggeredAnimation()async{
    for(int i = _controllers.length-1; i>=0; i--){
      await Future.delayed(Duration(milliseconds: 100));
      _controllers[i].forward();
    }
  }

  @override
  void dispose() {
    for(int i=0; i<_controllers.length; i++){
      _controllers[i].dispose();
    }
    super.dispose();
  }

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

                  SlideTransition(
                    position: _animations[0],
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Text("Create an account", style: AppTextStyles.createAcc),
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

                  SizedBox(height: 36),

                  SlideTransition(
                    position: _animations[2],
                    child: MainTextField(
                      label: AppStrings.firstName,
                      hint: AppStrings.enterFirst,
                    ),
                  ),

                  SizedBox(height: 36),

                  SlideTransition(
                    position: _animations[3],
                    child: MainTextField(
                      label: AppStrings.lastName,
                      hint: AppStrings.enterLast,
                    ),
                  ),

                  SizedBox(height: 36),

                  SlideTransition(
                    position: _animations[4],
                    child: MainTextField(
                      label: AppStrings.phone,
                      hint: "+998",
                    ),
                  ),

                  AppDimens.s24,

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
                        Text(
                          AppStrings.acceptTerms,
                          style: AppTextStyles.acceptStyle,
                        ),
                      ],
                    ),
                  ),

                  AppDimens.s24,

                  SlideTransition(
                    position: _animations[6],
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: MainElevatedButton(
                        text: AppStrings.signUp,
                        onTapped: (){
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  SlideTransition(
                    position: _animations[7],
                      child: OrSignInWith(),
                  ),
                  SizedBox(height: 20),

                  SlideTransition(
                    position: _animations[8],
                    child: SizedBox(
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
                  ),

                  SizedBox(height: 36),

                  SlideTransition(
                    position: _animations[9],
                    child: RichText(
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
                    ),
                  )
                ],
              ),

          ),
        ),

    );
  }
}
