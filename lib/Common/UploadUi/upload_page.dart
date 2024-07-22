import 'package:flutter/material.dart';
import 'package:wakili_ui/Common/circle_button.dart';
import 'package:wakili_ui/Common/rTextField.dart';
import 'package:wakili_ui/appUtils/text_styling.dart';

class UploadPage extends StatelessWidget {

  UploadPage({super.key});

  TextEditingController pageLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
              child: Text(
                "Click the icon below to select a file from your device",
                style: Styling.largeTextDark,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 70,),
            CircleButton(
                buttonIcon: Icons.cloud_upload_rounded,
                onTap: (){},
                text: ""),
            const SizedBox(height: 70,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("OR", style: Styling.largeTextDark,),
            ),
            const SizedBox(height: 70,),
            RTextField(
              controller: pageLinkController,
              hintText: "Past A link here",
            )

          ],
        ),
      ),
    );
  }
}
