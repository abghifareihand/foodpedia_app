import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xff4fae5a);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color light = Color(0xffF6F6FD);
  static const Color dark = Color(0xff393F42);
  static const Color red = Color(0xffFB7181);
  static const Color lightBlue = Color(0xff40BFFF);
  static const Color blue = Color(0xff5C61F4);
  static const Color green = Color(0xff53D1B6);
  static const Color orange = Color(0xffFFC833);
  static const Color grey = Color(0xff9098B1);
  static const Color border = Color(0xffEFEEF1);
}

/// text style
TextStyle blackTextStyle = const TextStyle(color: AppColor.black);
TextStyle whiteTextStyle = const TextStyle(color: AppColor.white);
TextStyle greyTextStyle = const TextStyle(color: AppColor.grey);
TextStyle primaryTextStyle = const TextStyle(color: AppColor.primary);
TextStyle greenTextStyle = const TextStyle(color: AppColor.green);
TextStyle redTextStyle = const TextStyle(color: AppColor.red);

/// text weight
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
