import 'package:flutter/material.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';
import 'package:wakili_ui/appUtils/text_styling.dart';

class UploadDesc extends StatelessWidget {
  const UploadDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      child: Text('Upload a Document to start analysing or paste a link'
                          ' to the web page. Wakili will help you go through the '
                          'document, or copy content from the page to annalyze it. '
                          'for instance, Consider pasting a link to a terms of '
                          'agreement page',
                        style: Styling.normalLargeTextLight,
                        textAlign: TextAlign.center,),
                    ),

                  ],
                ),
              ),
            ),
          )

        ],
      ),

    );
  }
}
