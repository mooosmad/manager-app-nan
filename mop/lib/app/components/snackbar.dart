import 'package:flutter/material.dart' show Colors, Icon, Icons;
import 'package:get/get.dart';
import 'package:mop/app/utils/constants/constant.dart';

class CustomSnackBar {
  getSnackBar(String title, String description,
      {Icon icon = const Icon(
        Icons.error,
        color: Colors.red,
      ),
      int second = 5}) {
    return Get.snackbar(
      title,
      description,
      duration: Duration(seconds: second),
      backgroundColor: ConstantColors.primaryColor2,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      icon: icon,
    );
  }
}
