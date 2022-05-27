import 'package:flutter/cupertino.dart';
import 'package:helia/core/app_colors.dart';

class AppTextStyles {
  static TextStyle title = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.4,
  );

  static TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: AppColors.grey,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
  );

  static TextStyle onBoardButton1 = TextStyle(
    fontSize: 16,
    color: AppColors.white,
    letterSpacing: .4,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonSoftGreen = TextStyle(
    fontSize: 16,
    letterSpacing: .4,
    color: AppColors.green,
    fontWeight: FontWeight.bold,
  );
}
