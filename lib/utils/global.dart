import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';
import '../MainScreens/widgettree.dart';
import 'package:qrscan/qrscan.dart' as scanner;

int restsender = 0;

class UserApp {
  String name = "";
  String emailid = "";
}

UserApp Cuser = new UserApp();
String idtosearch = "";

class Student {
  String name = "";
  String email = "";
  String dob = "";
  String phone = "";
  String aadhaar = "";
  String address = "";
  String admission = "";
  String dept = "";
  String year = "";
  String rank = "";
}

Student CStudent = new Student();

class Teacher {
  String name = "";
  String email = "";
  String employeeId = "";
  String dept = "";
}

Teacher CTeacher = new Teacher();

Future<int> getData(String email) async {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');
  late var allData;
  QuerySnapshot querySnapshot = await _collectionRef.get();
  allData = await querySnapshot.docs.map((doc) => doc.data()).toList();
  for (var i in allData) {
    if (i["Email"] == email) {
      print(i);
      if (int.parse(i["Level"].toString()).isEqual(0))
        return 0;
      else
        return 1;
    }
  }
  return -1;
}

void Redirector(String email) async {
  print(await getData(email));
  if (await getData(email) == 1) {
    Get.toNamed("/first");
  } else if (await getData(email) == 0) {
    Get.toNamed("/studentfirst");
  }
}

Future<Widget> Redirector2(String email) async {
  print(await getData(email));
  if (await getData(email) == 1) {
    return Decider('/first');
  } else
    return Decider('/studentfirst');
}

Future<void> getDetails() async {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');
  late var allData;
  User? user = FirebaseAuth.instance.currentUser;
  String namefinder = (user!.email).toString();
  QuerySnapshot querySnapshot = await _collectionRef.get();
  allData = await querySnapshot.docs.map((doc) => doc.data()).toList();
  for (var i in allData) {
    if (i["Email"] == namefinder) {
      Cuser.emailid = namefinder;
      Cuser.name = i["Name"];
    }
  }
}

Future<void> getData1() async {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('students');
  late var allData;
  // idtosearch = "B19CS054";
  QuerySnapshot querySnapshot = await _collectionRef.get();
  allData = await querySnapshot.docs.map((doc) => doc.data()).toList();
  for (var i in allData) {
    if (i["Admission_No"] == idtosearch) {
      CStudent.name = i['Name'];
      CStudent.email = i['Email_Id'];
      CStudent.dob = i['DOB'];
      CStudent.phone = i['Phone'];
      CStudent.aadhaar = i['Aadhaar'];
      CStudent.address = i['Address'];
      CStudent.admission = i['Admission_No'];
      CStudent.dept = i['Department'];
      CStudent.year = i['Year'];
      CStudent.rank = i['Entrance_Rank'];
    }
  }
}

Future<void> qrfn() async {
  String cameraScanResult = "k";
  print("hello");
  var camerastatus = await Permission.camera.status;
  if (camerastatus.isGranted) {
    print("object");
    var cameraScanResult1 = await scanner.scan();
    cameraScanResult = cameraScanResult1.toString();
    Cuser.emailid = cameraScanResult;
    idtosearch = cameraScanResult;
    await getData1();
    Get.toNamed('/qrres');
  } else {
    var isGranted = await Permission.camera.request();
    if (isGranted.isGranted) {
      var cameraScanResult1 = await scanner.scan();
      cameraScanResult = cameraScanResult1.toString();
      Cuser.emailid = cameraScanResult;
      idtosearch = cameraScanResult;
      await getData1();
      Get.toNamed('/qrres');
    }
  }
}
