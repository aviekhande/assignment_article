import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const kColorPrimaryBg = Color(0xFF0D1117);
  static const kColorPrimaryText = Color(0xffEAEAEA);

  static const kColorWhite100 = Color(0xFFEAEAEA);
  static const kColorWhite75 = Color(0xFFB3B4B5);
  static const kColorWhite50 = Color(0xFF7B7D80);
  static const kColorWhite25 = Color(0xFF7B7D80);
  static const kColorWhite15 = Color(0xFF2E3237);
  static const kColorGrey = Color.fromRGBO(124, 124, 124, 1);

  static const kColorWhite5 = Color(0xFF181C22);
  static const kColorWhite0 = Color(0xFF0D1117);
  static const kColorError = Color(0xffE74C3C);
  static const kColorblack10 = Color(0x1A333333);
  static const kColorblack75 = Color(0xBF333333);
  static const kColorPurple100 = Color(0xFF607BFF);
  static const kColorWideButtonBorder = Color(0xFF7b7d80);
  static const kColorBorder = Color(0xFFE0E0E0);

  static const kColorStatusSuccess = Color(0xFF59C38E);
  static const kColorStatusFailure = Color(0xFFE57373);

  static const String pinkNeon = '\x1B[38;5;213m'; // Light Pink / Neon Pink
  static const String brightCyan = '\x1B[38;5;51m'; // Very bright Cyan
  static const String electricPurple = '\x1B[38;5;93m'; // Electric Purple
  static const String limeGreen = '\x1B[38;5;118m'; // Vibrant Lime Green

  static const kColorYellow = Color(0xffFECC09);

  static const kColorPrimary = Color(0xFF4169E1);

  /// High Severity - Red with ~53% opacity
  static const Color kColorHigh = Color(0x88FF0000);

  /// Medium Severity - Amber with ~53% opacity
  static const Color kColorMedium = Color(0x88FFC107);

  /// Low Severity - Green with ~53% opacity
  static const Color kColorLow = Color(0x884CAF50);
  static const Color kColorHighFull = Color(0xFFFF0000); // Fully opaque red
  static const Color kColorMediumFull = Color(0xFFFFC107); // Fully opaque amber
  static const Color kColorLowFull = Color(0xFF4CAF50); // Fully opaque green

  static const kColorPrimaryShadow = Color(0xFFEFC10A);
  static const kColorAssignedOrderNum = Color(0xFFFFA500);
  static const kColorSecondary = Color(0xff260D46);
  static const kColorText = Color.fromRGBO(39, 39, 39, 0.75);
  static const kColorTextOffBlack = Color(0xFF272727);
  static const kColorBlack = Color(0xff000000);
  static const kColorWhite = Color(0xffffffff);
  static const kColorOffWhite = Color.fromRGBO(255, 254, 250, 1);
  static const kColorTransparent = Colors.transparent;
  static const kColorRedNotification = Color(0xFFEB3737);
  static const kColorPendingOrderStatus = Color(0xffFF9A00);
  static const kColorBoxShadow = Color(0xffFFEDC3);
  static const kColorSearchBarHintText = Color(0xFF1E1E1E);
  static const kColorDefaultImgPlaceholder = Color(0xFF4A7AFF);

  //Dashboard Charts

  //Strokes
  static const kColorCircleNew = Color(0xFF4169E1);
  static const kColorCirclePacking = Color(0xFF6B8E23);
  static const kColorCircleVerified = Color(0xFF20B2AA);
  static const kColorCircleDispatch = Color(0xFFFF8C00);
  static const kColorCirclePickup = Color(0xFF4B0082);
  static const kColorCircleDelivered = Color(0xFF228B22);
  static const kColorCircleIssue = Color(0xFFFF6347);
  static const kColorCircleRecollect = Color(0xFF800080);
  static const kColorCircleReturned = Color(0xFF696969);

  //Strokes
  static const kColorCircleNewBg = Color(0xFFE3E9FB);
  static const kColorCirclePackingBg = Color(0xFFE9EEDE);
  static const kColorCircleVerifiedBg = Color(0xFFDEF3F2);
  static const kColorCircleDispatchBg = Color(0xFFFFEED9);
  static const kColorCirclePickupBg = Color(0xFFE4D9EC);
  static const kColorCircleDeliveredBg = Color(0xFFDEEEDE);
  static const kColorCircleIssueBg = Color(0xFFFFE8E3);
  static const kColorCircleRecollectBg = Color(0xFFECD9EC);
  static const kColorCircleReturnedBg = Color(0xFFE9E9E9);

  //Logging
  static const String reset = '\x1B[0m';
  static const String red = '\x1B[31m';
  static const String green = '\x1B[32m';
  static const String yellow = '\x1B[33m';
  static const String blue = '\x1B[34m';
  static const String magenta = '\x1B[35m';
  static const String cyan = '\x1B[36m';
  static const String white = '\x1B[37m';
}
