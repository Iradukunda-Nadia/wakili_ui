import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wakili_ui/Services/common_service.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key, bool showText) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        showText == false? Offstage():SizedBox(height: 10,),
                        showText == false? Offstage():Text("Please Wait....",style:
                        TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }

  static Future<void> loadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => true,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.transparent,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }

  static Future<void> showLoginDialog(BuildContext context, GlobalKey key, child) async {
    return showGeneralDialog<void>(
        context: context,
        barrierDismissible: false,
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return new WillPopScope(
              key: key,
              onWillPop: () async => false,
              child: child
          );
        });
  }
  static Future<void> showLoginFromPublic(BuildContext context, GlobalKey key, child) async {
    return showGeneralDialog<void>(
        context: context,
        barrierDismissible: false,
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return new WillPopScope(
              key: key,
              onWillPop: () async => false,
              child: child
          );
        });
  }

  static Future<void> showOtherDialog(BuildContext context, GlobalKey key, child) async {
    return showGeneralDialog<void>(
        context: context,
        barrierDismissible: false,
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return new WillPopScope(
              key: key,
              onWillPop: () async => true,
              child: child
          );
        });
  }
  static Future<void> showFileLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        SizedBox(height: 10,),
                        Text("loading" + '...',style: TextStyle(color: Colors.black),),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primaryColor),
                          ),
                        ),
                        SizedBox(height: 10,),
                      ]),
                    )
                  ]));
        });
  }

  static Future<void> showErrorAlertDialog(BuildContext context, title, content, okPressed(), bool? showCancel) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        okPressed();
      },
    );
    Widget cancelButton = TextButton(
      child: Text("Not now"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: content != ''? Text(content): SizedBox(height: 0,),
      actions: [
        okButton,
        showCancel == true? cancelButton: Offstage()
      ],
    );

    // show the dialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showToastDialog(txt) {
    FToast fToast = FToast();
    // show the dialog
    return fToast.showToast(
      toastDuration: Duration(seconds: 3),
      child: Material(
        color: Colors.transparent,
        child: CommonService().toast("<h3>$txt</h3>"),
      ),
      gravity: ToastGravity.TOP,
    );
  }

  saveButton(saveText, onSave()){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: onSave,
            child: Container(
              width: saveText== 'Select'? 110:95,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: ShapeDecoration(
                color: saveText== 'Select'?AppColors.primaryColor: Color(0xFF115362),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(saveText== 'Select' ? CupertinoIcons
                          .checkmark_rectangle_fill:
                      Icons.save, color: Colors.white, size:
                      25),
                      SizedBox(width: 5),
                      Text(
                        saveText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFF5F5F5),
                          fontSize: 16,
                          fontFamily: 'Circular Std',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
