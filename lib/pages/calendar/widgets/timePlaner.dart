import "package:cloud_firestore/cloud_firestore.dart";
import "package:fluter_agenda/models/Event.dart";
import "package:flutter/material.dart";
import 'package:syncfusion_flutter_calendar/calendar.dart';

DateTime get _now => DateTime.now();

class timePlaner extends StatefulWidget {
  DateTime date_passed;
  final Function(DateTime) callback;

  timePlaner({Key? key, required this.date_passed, required this.callback})
      : super(key: key);

  @override
  State<timePlaner> createState() => _timePlanerState();
}

class _timePlanerState extends State<timePlaner> {
  // Let's get two dates :
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  List<Meeting> meetings = <Meeting>[];

  List<Meeting> _getDataSource() {
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));

    return meetings;
  }

  @override
  void forceUpdate(DateTime _date) {
    // TODO: implement setState
    setState(() {
      widget.callback(_date);
    });
  }

  //CalendarControllerProvider.of(context).controller.add(event);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1500,
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("evenements").snapshots(),
            builder: (context, snapshot) {
              List<Row> clientWidgets = [];

              try {
                // Attempt to access Firestore data here
                if (snapshot.hasData) {
                  final evenements = snapshot.data?.docs.reversed.toList();
                  for (var evenement in evenements!) {
                    setState(() {
                      meetings.add(Meeting(
                          evenement['eventName'],
                          evenement['dateStart'].toDate(),
                          evenement['dateEnd'].toDate(),
                          Color(int.parse(evenement['Color'])),
                          false));
                    });
                  }
                }
              } catch (e) {
                print('Firestore Error: $e');
                // Handle the error (e.g., display an error message)
              }

              return SfCalendar(
                view: CalendarView.day,
                firstDayOfWeek: 6,
                initialDisplayDate: widget.date_passed,
                initialSelectedDate: widget.date_passed,
                dataSource: MeetingDataSource(_getDataSource()),
                showDatePickerButton: false,
                showNavigationArrow: false,
              );
            }));
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
