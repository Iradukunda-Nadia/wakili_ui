import 'package:flutter/material.dart';
import 'package:wakili_ui/Common/UploadUi/upload_page.dart';
import 'package:wakili_ui/Common/customAppbar.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';

class MobileUploadPage extends StatefulWidget {
  const MobileUploadPage({super.key});

  @override
  State<MobileUploadPage> createState() => _MobileUploadPageState();
}

class _MobileUploadPageState extends State<MobileUploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppbar().customAppBarWidget(context),
      body: UploadPage(),
    );
  }
}
