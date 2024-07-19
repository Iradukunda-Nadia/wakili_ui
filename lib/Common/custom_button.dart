import 'package:flutter/material.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';


class CustomButton extends StatelessWidget {
  final String buttonText;
  final bool? disabled;
  final Icon icon;
  final Function () onPressed;
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.disabled,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 100,
      ),
      child: ElevatedButton(
          onPressed: disabled == true?null:onPressed,
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: disabled == true? MaterialStateProperty.all<Color>
                (AppColors.greylighten1):
              MaterialStateProperty.all<Color>(AppColors.primaryDarken),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  ))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: const TextStyle(
                      fontSize: 20, color: Colors.white
                  ),),
                const SizedBox(width: 8,),
                icon
              ],
            ),
          )
      ),
    );
  }
}