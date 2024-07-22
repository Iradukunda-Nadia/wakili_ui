import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wakili_ui/Common/custom_button.dart';
import 'package:wakili_ui/Common/custom_transition.dart';
import 'package:wakili_ui/Mobile/mobile_upload.dart';
import 'package:wakili_ui/Web/web_upload.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';
import 'package:wakili_ui/appUtils/text_styling.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover
          ),

        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Image(image: AssetImage("assets/logo.png"), height: 300, width:
              300, ),
              const SizedBox(height: 50,),
              Container(
                height: MediaQuery.of(context).size.height/2 -50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.primaryDarken.withOpacity(0.2),
              ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text('Wakili Online is your online trusted '
                              'legal assistant. Helping you annalyze, Summarize and understand Legal text',
                          style: Styling.normalLargeTextLight,
                          textAlign: TextAlign.center,),
                        ),
                        CustomButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    kIsWeb? WebUpload():  MobileUploadPage()));
                          },
                          buttonText: "Get Started Now ;)",
                          icon: const Icon(CupertinoIcons.forward, color:
                          Colors.white,),
                          disabled: false,
                        ),

                      ],
                    ),
                  ),
                ),
              )

            ],
          )),
    );
  }
}
