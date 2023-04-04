import 'package:flutter/material.dart';

class EnableReminders extends StatefulWidget {
  final Function callback;

  const EnableReminders({Key? key, required this.callback}) : super(key: key);

  @override
  State<EnableReminders> createState() => _EnableRemindersState();
}

class _EnableRemindersState extends State<EnableReminders> {

  List<int> days = [5,2,1];
  bool onlyMandatory = false;
  bool add = false;
  bool cancel = false;
  TextEditingController _day = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    // width: MediaQuery.of(context).size.width*0.5,
                    child: const Text("Set Reminders only for Mandatory Vaccines")
                ),
                Checkbox(value: onlyMandatory, onChanged: (value) {
                  print(value);
                  setState(() {
                    onlyMandatory = !onlyMandatory;
                  });
                }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: days.length,
                itemBuilder: (_, i) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${days[i]} days before"),
                    ],
                  );
                },
              ),
            ),
            add ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 40,
                        child: TextField(
                          controller: _day,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)
                            ),
                          ),
                        ),
                      ),
                    ),
                    OutlinedButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.add),
                          ),
                          Text("Add"),
                        ],
                      ),
                      onPressed: () {
                        if(_day.text == "") return;
                        List<int> newDays = days + [int.parse(_day.text)];
                        newDays.sort((a, b) => b.compareTo(a));
                        setState(() {
                          add = false;
                          days = newDays;
                        });
                      },
                    ),
                  ],
                ) : Container(),
            OutlinedButton(
              child: const Text("Add Reminder"),
              onPressed: () {
                setState(() {
                  add = true;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    child: const Text("Done"),
                    onPressed: () async {
                      await widget.callback(days, onlyMandatory);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    child: const Text("Cancel"),
                    onPressed: () {
                      // setState(() {
                      //   cancel = true;
                      // });
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
