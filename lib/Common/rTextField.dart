import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';

class RTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;

  const RTextField({super.key,
    this.hintText,
    required this.controller,
  });

  @override
  State<RTextField> createState() => _RTextFieldState();
}

class _RTextFieldState extends State<RTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryDarken.withOpacity(0.1),
        border: Border(
          top: BorderSide(color: AppColors.primaryDarken),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          controller: widget.controller,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDarken,
          ),
          cursorColor: AppColors.primaryDarken,
          maxLines: null,
          decoration: InputDecoration(
            hintText: widget.hintText?? "Type Something",
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDarken.withOpacity(0.5),
            ),
            border: InputBorder.none,
            fillColor: Colors.transparent,
            filled: true,
            suffix: Container(
              constraints: BoxConstraints(
                  maxWidth: 70,
                  minWidth: 30,
                  minHeight: 30),
              child: MaterialButton(
                minWidth: 0,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                textColor: Colors.white,
                color: widget.controller.text.length<= 0?
                AppColors.primaryDarken.withOpacity(.2):
                AppColors.primaryDarken,
                onPressed: (){},
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(25)),
                child: const Icon(Icons.send_rounded),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
