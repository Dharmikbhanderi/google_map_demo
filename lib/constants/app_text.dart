import 'package:flutter/material.dart';
import 'package:practicalMap/constants/app_colors.dart';


class AppText{
  static var textRegular = const TextStyle(
      fontSize: 18,
      color: primaryColor);

  static var textLight = textRegular.copyWith(fontWeight: FontWeight.w200);

  static var textMedium = textRegular.copyWith(fontWeight: FontWeight.w500);

  static var textSemiBold = textRegular.copyWith(fontWeight: FontWeight.w600,fontSize: 18/*color: Colors.white*/);

  static var textBold = textRegular.copyWith(fontWeight: FontWeight.bold);

}