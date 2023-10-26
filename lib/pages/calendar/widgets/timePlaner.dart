import "package:fluter_agenda/models/Event.dart";
import "package:flutter/material.dart";
import 'package:calendar_view/calendar_view.dart';

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
        child: DayView(
          controller: EventController()..addAll(_events),
          eventTileBuilder: (date, events, boundry, start, end) {
            // Return your widget to display as event tile.
            return Container();
          },
          fullDayEventBuilder: (events, date) {
            // Return your widget to display full day event view.
            return Container();
          },
          showVerticalLine: true,
          // To display live time line in day view.
          showLiveTimeLineInAllDays: true,
          // To display live time line in all pages in day view.
          minDay: DateTime(1990),
          maxDay: DateTime(2050),
          initialDay: widget.date_passed,
          heightPerMinute: 1,
          // height occupied by 1 minute time span.
          eventArranger: SideEventArranger(),
          // To define how simultaneous events will be arranged.
          onEventTap: (events, date) => print(events),
          onDateLongPress: (date) => print(date),
          onDateTap: (date) => widget.callback(date),
        ));
  }
}

List<CalendarEventData> _events = [
  CalendarEventData(
    date: _now,
    event: Event(title: "Joe's Birthday"),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 22),
  ),
  CalendarEventData(
    date: _now.add(Duration(days: 1)),
    startTime: DateTime(_now.year, _now.month, _now.day, 18),
    endTime: DateTime(_now.year, _now.month, _now.day, 19),
    event: Event(title: "Wedding anniversary"),
    title: "Wedding anniversary",
    description: "Attend uncle's wedding anniversary.",
  ),
  CalendarEventData(
    date: _now,
    startTime: DateTime(_now.year, _now.month, _now.day, 14),
    endTime: DateTime(_now.year, _now.month, _now.day, 17),
    event: Event(title: "Football Tournament"),
    title: "Football Tournament",
    description: "Go to football tournament.",
  ),
  CalendarEventData(
    date: _now.add(Duration(days: 3)),
    startTime: DateTime(_now.add(Duration(days: 3)).year,
        _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 10),
    endTime: DateTime(_now.add(Duration(days: 3)).year,
        _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 14),
    event: Event(title: "Sprint Meeting."),
    title: "Sprint Meeting.",
    description: "Last day of project submission for last year.",
  ),
  CalendarEventData(
    date: _now.subtract(Duration(days: 2)),
    startTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        14),
    endTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        16),
    event: Event(title: "Team Meeting"),
    title: "Team Meeting",
    description: "Team Meeting",
  ),
  CalendarEventData(
    date: _now.subtract(Duration(days: 2)),
    startTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        10),
    endTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        12),
    event: Event(title: "Chemistry Viva"),
    title: "Chemistry Viva",
    description: "Today is Joe's birthday.",
  ),
];
