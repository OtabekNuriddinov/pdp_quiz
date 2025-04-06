import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdp_quiz/core/config/routes.dart';
import 'package:pdp_quiz/screen/profile_screen/profile_screen.dart';

BottomNavigationBar bottomNavigationBar(int active, BuildContext context) {
  return BottomNavigationBar(
    onTap: (int index) {
      switch (index) {
        case 0:
          {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.home,
            );
          }
        case 1:
          {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.users,
            );
          }
        case 2:
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
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
