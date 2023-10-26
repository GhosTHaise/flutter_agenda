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

  //controller
  final nameEventController = TextEditingController();
  final startDateEventController = TextEditingController();

  DateTime startEvent = DateTime.now();
  DateTime endEvent = DateTime.now();

  void updateDate(DateTime _date) {
    setState(() {
      date = _date;
      print("date changesd");
    });
  }

  Future<void> _selectStartDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));

    if (_picked != null) {
      startDateEventController.text = _picked.toString();
    }
  }

  Future<void> _selectEndDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));

    if (_picked != null) {
      setState(() {
        endEvent = _picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Calendar",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xCE181818),
                  )),
              TextButton(
                  onPressed: () => {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                height: 400,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: nameEventController,
                                      decoration: const InputDecoration(
                                          labelText: "Event Name :",
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blueAccent))),
                                    ),
                                    TextFormField(
                                      controller: nameEventController,
                                      readOnly: true,
                                      onTap: () {
                                        _selectStartDate();
                                      },
                                      decoration: const InputDecoration(
                                          labelText: "Date Start",
                                          filled: true,
                                          prefixIcon:
                                              Icon(Icons.calendar_today),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blueAccent))),
                                    ),
                                    TextFormField(
                                      controller: nameEventController,
                                      decoration: const InputDecoration(
                                          labelText: "Date End",
                                          filled: true,
                                          prefixIcon:
                                              Icon(Icons.calendar_today),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blueAccent))),
                                    ),
                                    TextFormField(
                                      controller: nameEventController,
                                      decoration: const InputDecoration(
                                          labelText: "Color :",
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blueAccent))),
                                    ),
                                  ],
                                ),
                              );
                            })
                      },
                  child: Text("Ajouter"))
            ],
          ),
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
