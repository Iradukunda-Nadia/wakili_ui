import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wakili_ui/Common/circle_button.dart';
import 'package:wakili_ui/Common/custom_transition.dart';
import 'package:wakili_ui/Common/rTextField.dart';
import 'package:wakili_ui/Mobile/mobile_upload.dart';
import 'package:wakili_ui/Services/process_docs_service.dart';
import 'package:wakili_ui/Web/web_upload.dart';
import 'package:wakili_ui/appUtils/text_styling.dart';

import '../dialogs.dart';

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
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles();
                  if (result != null) {
                    File file = File(result.files.single.path!);
                  } else {
                    Dialogs.showToastDialog("Oops! Something went wrong while "
                        "processing your upload, \n Please Try again Later");
                  }
                },
                text: ""),
            const SizedBox(height: 70,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("OR", style: Styling.largeTextDark,),
            ),
            const SizedBox(height: 70,),
            RTextField(
              controller: pageLinkController,
              hintText: "Copy and Paste A link here",
              onSuffixTapped: (txt) async {
                Future<Map<String, dynamic>> processedDoc =
                DocsProcessing().extractWebPage(txt.replaceAll(" ", ""));
                processedDoc.then((response){
                  if(response['status']){
                    Navigator.push(
                        context,
                        CustomPageRoute(
                            kIsWeb? WebUpload():  MobileUploadPage()));
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
