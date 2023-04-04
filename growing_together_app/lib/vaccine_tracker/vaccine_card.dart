import 'dart:math';

import 'package:flutter/material.dart';
import 'package:growing_together/ui_utils/colors.dart';
import 'package:growing_together/vaccine_tracker/vaccines.dart';
import 'package:intl/intl.dart';

class VaccineCard extends StatefulWidget {
  final Vaccine vaccine;
  final int doseNumber;
  final DateTime dueDate;
  final VaccinationStatus status;
  final Function updateDOVCallback;
  const VaccineCard({Key? key, required this.vaccine, required this.doseNumber, required this.dueDate, required this.status, required this.updateDOVCallback}) : super(key: key);

  @override
  State<VaccineCard> createState() => _VaccineCardState();
}

class _VaccineCardState extends State<VaccineCard> {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.vaccine.name,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(" (Dose #${widget.doseNumber})", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),),
      leading: VSIconMap[widget.status],
      trailing: InkWell(
        onTap: () {
          showDialog(context: context, builder: (_) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(child: Card(child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(widget.vaccine.info),
            ),)),
          ));
        },
        child: Icon(Icons.info),
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      textColor: MyColors.accent3,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Requirement: ${widget.vaccine.required ? "Mandatory" : "Optional"}",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Side effects: ${widget.vaccine.sideEffects}",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Due Date: ${formatter.format(widget.dueDate)}",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        Builder(
          builder: (context) {
            if(widget.status == VaccinationStatus.Received) {
              return Container();
            }
            return OutlinedButton(
              child: Text("Received"),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));
                widget.updateDOVCallback(widget.vaccine.uid, pickedDate);
              },
            );
          }
        ),
      ],
    );
  }
}
