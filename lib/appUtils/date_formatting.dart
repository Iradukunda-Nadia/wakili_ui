import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wakili_ui/appUtils/app_colors.dart';

class QdateFormat extends StatelessWidget {
  bool? dateEvent;
  bool isScheduled;
  String? date;
  QdateFormat({Key? key, this.dateEvent, this.date, required this.isScheduled}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final dateToCheck = DateTime.parse(date!);
    final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 0.0),
          //  Calendar Icon
          child: Icon(Icons.calendar_month_outlined),
        ),
        Text(aDate== today && dateEvent != true && isScheduled != true
            ? 'Today - ${DateFormat('d MMMM yyyy')
            .format(DateTime.parse(date!))}'
            : aDate== yesterday && dateEvent != true && isScheduled != true
            ? 'Yesterday - ${DateFormat('d MMMM yyyy')
            .format(DateTime.parse
          (date!))}'
            :isScheduled == true
            ? DateFormat('EEEE - d MMMM yyyy, hh:mm').format(DateTime.parse(date!)).capitalize()
            : DateFormat('EEEE - d MMMM yyyy').format(DateTime.parse(date!)).capitalize(),
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12, color: AppColors.labelColor),
        ),
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}