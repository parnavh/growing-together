import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

import 'package:growing_together/vaccine_tracker/vaccines.dart';

class VaccineData {
  static final String collectionVaccine = 'Vaccine';

  static final firestore = FirebaseFirestore.instance;

  static Future<List<Vaccine>> fetchVaccines() async {
    QuerySnapshot snapshot = await firestore.collection(collectionVaccine).get();
    debugPrint("# of vaccines ${snapshot.docs.length}");

    List<Vaccine> vaccines = snapshot.docs.map((doc) {
      Map<String, dynamic> d = doc.data() as Map<String, dynamic>;
      // print("Map $d");
      Vaccine v = Vaccine.fromJson(doc.id, d);
      // print("object ${a.toString()}");
      return v;
    }).toList();
    debugPrint(vaccines.length.toString());
    return vaccines;
  }

  static Future<bool> uploadVaccines(List<Map<String, dynamic>> vaccs) async {

    List<Vaccine> vaccines = [];
    int c = 0;

    for(int i=0; i<vaccs.length; i++) {
      var d = vaccs[i];
      int ageGroup = d["ageGroup"];
      List<int> intervals = d["intervals"].cast<int>();
      for (int j = 0; j < d['doses']; j++) {
        ageGroup += intervals[j];
        Vaccine v = Vaccine(uid: c.toString().padLeft(2, "0"),
            name: d["name"],
            info: d["info"],
            required: d["required"],
            sideEffects: d["sideEffects"],
            ageGroup: ageGroup,
            dosesNumber: j);

        vaccines.add(v);

        c++;
      }
    }

      print(vaccines.length);

      List<Map<String, dynamic>> data = vaccines.map((v) => v.toJson()).toList();
      print(data.length);

      try {
        for (int i = 0; i < data.length; i++) {
          firestore
              .collection(collectionVaccine)
              .doc(vaccines[i].uid)
              .set(data[i]); //.then((value) => debugPrint(value.id));
        }
      } catch(e) {
        print(e);
        return false;
      }

      return true;

    // List<Map<String, dynamic>> data = vaccs.map((v) => v.toJson()).toList();
    //
    // debugPrint(data[0].toString());
    // int pad = data.length.toString().length;
    //
    // for(int i=0; i<data.length; i++) {
    //   firestore.collection(collectionVaccine).doc(i.toString().padLeft(pad, '0')).set(data[i]); //.then((value) => debugPrint(value.id));
    // }
    //
    // return true;
  }

  // For new Users
  static Future<Map<String, DateTime?>> dovEmptyTemplate() async {
    QuerySnapshot snapshot = await firestore.collection(collectionVaccine).get();
    debugPrint("# of vaccines ${snapshot.docs.length}");

    Map<String, DateTime?> vsEmptyTemplate = {};
    for (var doc in snapshot.docs) {
      vsEmptyTemplate[doc.id] = null;
    }

    return vsEmptyTemplate;
  }

  static Future<Vaccine> fetchVaccine(String uid) async {
    DocumentSnapshot doc = await firestore.collection(collectionVaccine).doc(uid).get();
    Vaccine vaccine = Vaccine.fromJson(doc.id, doc.data() as Map<String, dynamic>);
    return vaccine;
  }

}