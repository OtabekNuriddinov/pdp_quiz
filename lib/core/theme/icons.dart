import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
sealed class AppIcons{
  static SvgPicture pdp = SvgPicture.asset("assets/icons/pdp_logo.svg");
  static SvgPicture googleBut = SvgPicture.asset("assets/icons/google_button.svg");

  static const back=Icon(Icons.arrow_back_rounded);
  static const home=Icon(Icons.home_outlined);
  static const center=Icon(Icons.business);
  static const person=Icon(Icons.account_circle_outlined);

  static SvgPicture littleFlutter = SvgPicture.asset("assets/icons/little_flutter_logo.svg");
}