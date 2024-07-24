import 'package:flutter/material.dart';
import 'package:wakili_ui/Common/UploadUi/upload_description.dart';
import 'package:wakili_ui/Common/UploadUi/upload_page.dart';
import 'package:wakili_ui/Common/customAppbar.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';

class WebUpload extends StatelessWidget {
  const WebUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppbar().customAppBarWidget(context),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (MediaQuery.of(context).devicePixelRatio/2),
        children: <Widget>[
          UploadPage(),
          const UploadDesc()
        ],
      )
    );
  }
}
