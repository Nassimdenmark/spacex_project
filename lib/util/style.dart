import 'package:flutter/material.dart';

class Style {
  // Text styles
  static final baseTextStyle = const TextStyle(fontFamily: 'Nunito_Sans');

  static final commonTextStyle = baseTextStyle.copyWith(
      color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w400);

  static final mediumCommonTextStyle =
      commonTextStyle.copyWith(fontSize: 19.0, fontWeight: FontWeight.w500);

  static final largeCommonTextStyle = commonTextStyle.copyWith(fontSize: 23.0);

  static final smallCommonTextStyle = commonTextStyle.copyWith(fontSize: 16.5);

  static final smallCommonLineHeightTextStyle =
      smallCommonTextStyle.copyWith(height: 1.5);

  static final appBarTextStyle = mediumCommonTextStyle.copyWith(
      letterSpacing: 0.7, fontWeight: FontWeight.w600, fontSize: 24);

  static final headerTextStyle =
      commonTextStyle.copyWith(color: Colors.white.withOpacity(0.9));

  static final smallHeaderTextStyle = headerTextStyle.copyWith(
      color: Colors.white.withOpacity(0.9), fontSize: 16);

  static final failTextStyle =
      commonTextStyle.copyWith(color: Colors.redAccent);

  // Color styles
  static final primaryBackgroundColor = Color(0xFF34495e);

  static final secondaryBackgroundColor = Color(0xFF2c3e50);

  static final shadowColor = Color(0xFF2c3e50);

  static final failColor = Color(0xFFe74c3c);

  static final greenColor = Color(0xFF27ae60);

  static final iconForegroundColor = Colors.white;

  static final iconBackgroundColor = Color(0xFF2c3e50);
}
