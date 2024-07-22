
import 'package:flutter/material.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';

class CustomAppbar{
  customAppBarWidget(context){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: const Image(
          image: AssetImage("assets/logo.png"), height: 70, width: 50,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,
                  horizontal: 10),
              child: Icon(
                Icons.menu_outlined,
                color: AppColors.primaryDarken,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}