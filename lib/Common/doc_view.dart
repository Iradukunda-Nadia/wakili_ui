import 'package:flutter/material.dart';
import 'package:wakili_ui/Common/customAppbar.dart';

class DocView extends StatelessWidget {
  const DocView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar().customAppBarWidget(context),
    );
  }
}
