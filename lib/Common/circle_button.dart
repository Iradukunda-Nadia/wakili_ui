import 'package:flutter/material.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';
import 'package:wakili_ui/appUtils/text_styling.dart';

class CircleButton extends StatelessWidget {
  final IconData buttonIcon;
  final VoidCallback onTap;
  final String text;
  const CircleButton({
    Key? key,
    required this.buttonIcon,
    required this.onTap,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CircleAvatar(
          backgroundColor: AppColors.primaryDarken,
          radius: 30,
          child: Icon( buttonIcon,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}