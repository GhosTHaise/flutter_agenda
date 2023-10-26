import "package:fluter_agenda/pages/calendar/widgets/timeLine.dart";
import "package:fluter_agenda/pages/calendar/widgets/timePlaner.dart";
import "package:flutter/material.dart";

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  //
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime date = DateTime.now();

  void updateDate(DateTime _date) {
    setState(() {
      date = _date;
      print("date changesd");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text("Calendar",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xCE181818),
              )),
        ),
        const SizedBox(height: 10),
        timeLine(date_passed: date, callback: updateDate),
        const SizedBox(height: 15),
        Expanded(
            child: Container(
          child: SingleChildScrollView(
              child: timePlaner(date_passed: date, callback: updateDate)),
        )),
      ],
    );
    ;
  }
}
