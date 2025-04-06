import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

sealed class AppIcons{
  static SvgPicture pdp = SvgPicture.asset("assets/icons/pdp_logo.svg");
  static SvgPicture googleBut = SvgPicture.asset("assets/icons/google_button.svg");

  static const back=Icon(Icons.arrow_back_rounded);

  static SvgPicture littleFlutter = SvgPicture.asset("assets/icons/little_flutter_logo.svg");

  /// For Home Screen
  static SvgPicture grade = SvgPicture.asset("assets/icons/grade.svg");
  static SvgPicture home = SvgPicture.asset("assets/icons/home.svg");
  static SvgPicture profile = SvgPicture.asset("assets/icons/profile.svg");
}