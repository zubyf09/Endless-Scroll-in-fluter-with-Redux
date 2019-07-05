import 'package:flutter/material.dart';
import 'assets.dart';
import 'dimens.dart';
import 'app_color.dart';

class Style {

  static final TextStyle userNameStyle = TextStyle(
      fontSize: Dimens.upCommingEmpty,
      fontFamily: Assets.fontFamily,
      color: Colors.white,
      fontWeight: FontWeight.w600);

  static final TextStyle dayState = TextStyle(
      fontSize: Dimens.upCommingEmpty,
      fontFamily: Assets.fontFamily,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  //Budget Summary Text Style.......
  static TextStyle bugetTitle = TextStyle();


  static final TextStyle dialogDesStyle = TextStyle(
      fontSize: 13,
      fontFamily: Assets.fontFamily,
      letterSpacing: .5,
      height: 1.1,
      color: AppColor.white,
      fontWeight: FontWeight.normal);


}
