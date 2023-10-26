import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class timeLine extends StatefulWidget {
  DateTime date_passed;

  final Function(DateTime) callback;

  timeLine({Key? key, required this.date_passed, required this.callback})
      : super(key: key);

  @override
  State<timeLine> createState() => _timeLineState();
}

class _timeLineState extends State<timeLine> {
  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      initialDate: widget.date_passed,
      firstDate: DateTime(2019, 1, 15),
      lastDate: DateTime(2023, 12, 12),
      onDateSelected: (date) => widget.callback(date),
      leftMargin: 20,
      monthColor: Colors.blueGrey,
      dayColor: Colors.teal[200],
      activeDayColor: Colors.white,
      activeBackgroundDayColor: Colors.redAccent[100],
      dotsColor: Color(0xFF333A47),
      selectableDayPredicate: (date) => date.day != 23,
      locale: 'en_ISO',
    );
  }
}
