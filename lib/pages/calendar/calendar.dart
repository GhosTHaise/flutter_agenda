import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:fluter_agenda/pages/calendar/widgets/timeLine.dart";
import "package:fluter_agenda/pages/calendar/widgets/timePlaner.dart";
import "package:flutter/material.dart";
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
  final endDateEventController = TextEditingController();
  final colorEventController = TextEditingController();

  DateTime startEvent = DateTime.now();
  DateTime endEvent = DateTime.now();

  void updateDate(DateTime _date) {
    setState(() {
      date = _date;
    });
  }

  Future<void> _insertDate() async {
    CollectionReference collRef =
        FirebaseFirestore.instance.collection("evenements");
    Map<String, dynamic> data = {
      'Color': colorEventController.text,
      "eventName": nameEventController.text,
      "isAllDay": false,
      "dateStart": DateTime.parse(startDateEventController.text),
      "dateEnd": DateTime.parse(endDateEventController.text),
      'user': FirebaseAuth.instance.currentUser?.uid
    };
    collRef.add(data);

    Navigator.of(context).pop();
  }

  Future<void> _selectStartDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));
    print(_picked);
    if (_picked != null) {
      TimeOfDay? _time_picker =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (_time_picker != null) {
        print(_time_picker);
        startDateEventController.text = DateTime(_picked.year, _picked.month,
            _picked.day, _time_picker.hour, _time_picker.minute)
            .toString();
      }
    }
  }

  Future<void> _selectEndDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));

    if (_picked != null) {
      TimeOfDay? _time_picker =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (_time_picker != null) {
        print(_time_picker);
        endDateEventController.text = DateTime(_picked.year, _picked.month,
                _picked.day, _time_picker.hour, _time_picker.minute)
            .toString();
      }
    }
  }

  Future<void> _selectColor() async {
    Color pickerColor = Color(0xff443a49);
    Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
    String colorToHex(Color color) {
      return '#${color.value.toRadixString(16).substring(2)}';
    }

    void changeColor(Color color) {
      setState(() => pickerColor = color);
      colorEventController.text =
          "0x" + pickerColor.value.toRadixString(16).toString();
    }

// raise the [showDialog] widget
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),
              // Use Material color picker:
              //
              // child: MaterialPicker(
              //   pickerColor: pickerColor,
              //   onColorChanged: changeColor,
              //   showLabel: true, // only on portrait mode
              // ),
              //
              // Use Block color picker:
              //
              // child: BlockPicker(
              //   pickerColor: currentColor,
              //   onColorChanged: changeColor,
              // ),
              //
              // child: MultipleChoiceBlockPicker(
              //   pickerColors: currentColors,
              //   onColorsChanged: changeColors,
              // ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Got it'),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
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
                                padding: const EdgeInsets.only(
                                    top: 15, left: 30, right: 30, bottom: 50),
                                height: 500,
                                child: SingleChildScrollView(
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
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: startDateEventController,
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
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: endDateEventController,
                                    readOnly: true,
                                    onTap: () {
                                      _selectEndDate();
                                    },
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
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: colorEventController,
                                        readOnly: true,
                                        onTap: () {
                                          _selectColor();
                                        },
                                        decoration: const InputDecoration(
                                            labelText: "Color :",
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blueAccent))),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () => {_insertDate()},
                                              child: Text("Add Event")),
                                          SizedBox(
                                            width: 15,
                                      ),
                                      ElevatedButton(
                                            onPressed: () =>
                                                {Navigator.of(context).pop()},
                                            child: Text("Cancel"),
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.red),
                                          )
                                        ],
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                  },
                  child: const Text("Ajouter"))
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
