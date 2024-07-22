import 'dart:math' as math; // import this

import 'package:flutter/material.dart';
import 'package:wakili_ui/Common/random_ui/custom_ui.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';
import 'package:wakili_ui/appUtils/date_formatting.dart';

class ReceivedMessage extends StatelessWidget {
  final String message;
  final String chatType;
  final String name;
  final String date;
  final String image;
  const ReceivedMessage({
    Key? key,
    required this.message,
    required this.chatType,
    required this.name,
    required this.image,
    required this.date
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Padding(
          padding: EdgeInsets.only(right: 40.0, left: 18, top: 10, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: CustomPaint(
                  painter: Triangle(AppColors.greylighten2),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.greylighten2,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(name,
                              style: TextStyle(fontSize: 12, color: AppColors.labelColor)),
                          QdateFormat(
                            dateEvent: false,
                            isScheduled: false,
                            date: date,
                          ),
                        ],
                      ),
                      Text(
                        message,
                        style: TextStyle(color: Colors.black, fontFamily: 'Monstserrat', fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        chatType == 'direct' ?
        SizedBox(
          height: 30,
        ):image == null ?
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).primaryColor,
          child: Text(
            (name == ' ' || name ==''? '!' :name ?? '!').substring(0, 1).toUpperCase(),
            style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ):CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(image),
        ),
        messageTextGroup,
      ],
    );
  }
}