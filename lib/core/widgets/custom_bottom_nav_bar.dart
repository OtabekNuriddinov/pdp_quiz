import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdp_quiz/core/config/routes.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'package:pdp_quiz/screen/category_page/category_page.dart';
import 'package:pdp_quiz/screen/home_page/home_page.dart';
import 'package:pdp_quiz/screen/profile_screen/profile_screen.dart';
import 'package:pdp_quiz/screen/users/users_page.dart';

BottomNavigationBar bottomNavigationBar(int active, BuildContext context) {
  return BottomNavigationBar(
    backgroundColor: AppColors.white,
    onTap: (int index) {
      switch (index) {
        case 0:
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          }
        case 1:
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CategoryPage()));
          }
        case 2:
          {
            debugPrint("Push");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
          }
      }
    },
    items: [
      BottomNavigationBarItem(
          icon: active == 0
              ? SvgPicture.asset('assets/icons/home.svg')
              : SvgPicture.asset('assets/icons/homeIcon_black.svg'),
          label: ''),
      BottomNavigationBarItem(
          icon: active == 1
              ? SvgPicture.asset('assets/icons/gradeIcon_green.svg')
              : SvgPicture.asset('assets/icons/grade.svg'),
          label: ''),
      BottomNavigationBarItem(
          icon: active == 2
              ? SvgPicture.asset('assets/icons/profileIcon_green.svg')
              : SvgPicture.asset('assets/icons/profile.svg'),
          label: ''),
    ],
  );
}
