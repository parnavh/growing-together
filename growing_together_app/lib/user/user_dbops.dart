import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:growing_together/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:growing_together/vaccine_tracker/vaccine_data.dart';
import 'package:growing_together/vaccine_tracker/vaccines.dart';
import 'package:intl/intl.dart';

class UserDBOps {
  static final String collectionUser = 'User';
  static final String collectionVS = 'UserVS';

  static final firestore = FirebaseFirestore.instance;
  static final DateFormat formatter = DateFormat('dd-MM-yyyy');

  static Future<bool> userExists(String uid) async {
    try{
      DocumentSnapshot doc =
          await firestore.collection(collectionUser).doc(uid).get();
      return doc.exists;
    } catch(e) {
      print(e);
      return false;
    }
  }

  static Future<bool> createUser(User user) async {
    try{
      await firestore.collection(collectionUser).doc(user.uid).set(user.toJson());
      return true;
    } catch(e) {
      print(e);
      return false;
    }
  }

  static Future<User> getCurrentUser() async {
    String uid = auth.FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot doc = await firestore.collection(collectionUser).doc(uid).get();
    print(doc.id);
    User user = User.fromJson(doc.id, doc.data() as Map<String, dynamic>);
    return user;
  }

  static Future<Map<String, DateTime?>> fetchDOVs(User user) async {
    DocumentSnapshot doc = await firestore.collection(collectionVS).doc(user.uid).get();

    if(doc.exists) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Map<String, dynamic> dovsData = data['dovs'];

      Map<String, DateTime?> dovs = dovsData.map((key, value) => MapEntry(
          key,
          value.toString() == "" ? null : formatter.parse(value.toString()
          )
      ));
      return dovs;
    }
    else {
      return await VaccineData.dovEmptyTemplate();
    }
  }

  static Future<bool> logout() async {
    try {
      await auth.FirebaseAuth.instance.signOut();
      return true;
    } catch(e) {
      print(e);
      return false;
    }
  }

  static Future<bool> setDOV(String uid, Map<String, DateTime?> dovs, DateTime dov, String vaccId) async {
    Map<String, DateTime?> newDOVs = dovs;
    newDOVs[vaccId] = dov;

    Map<String, String> status = newDOVs.map((key, value) => MapEntry(key, value == null ? "" : formatter.format(value)));

    try {
      await firestore.collection(collectionVS).doc(uid).set({"dovs": status});
      return true;

    } catch(e) {
      print("eee $e");
      return false;
    }
  }
}