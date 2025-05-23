import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wakili_ui/Services/common_service.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';

class RTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final Function (String txt) onSuffixTapped;

  const RTextField({super.key,
    this.hintText,
    required this.controller,
    required this.onSuffixTapped,
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
              constraints: const BoxConstraints(
                  maxWidth: 70,
                  minWidth: 30,
                  minHeight: 30),
              child: MaterialButton(
                minWidth: 0,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                textColor: Colors.white,
                color: widget.controller.text.isEmpty?
                AppColors.primaryDarken.withOpacity(.2):
                AppColors.primaryDarken,
                onPressed: widget.controller.text.isEmpty?
                (){
                  CommonService().
                  toast("Looks like you haven't posted a link yet");
                } :widget.onSuffixTapped(widget.controller.text),
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
