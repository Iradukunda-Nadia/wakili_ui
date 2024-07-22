import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';
import 'package:wakili_ui/appUtils/text_styling.dart';

class CommonService {
  Widget toast(text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      width: 330,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: AppColors.greyDarken5

      ),
      child: Text(
          text,
          style: Styling.normalTextLight),
    );
  }
}