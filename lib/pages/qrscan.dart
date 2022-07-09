import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project/utils/global.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrScan extends StatefulWidget {
  const QrScan({super.key});

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  @override
  String cameraScanResult = "k";
  late var allData;
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('students');

  Future<void> getData() async {
    // idtosearch = "B19CS054";
    QuerySnapshot querySnapshot = await _collectionRef.get();
    allData = querySnapshot.docs.map((doc) => doc.data()).toList();
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
        break;
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
            child: Container(
                child: Column(
          children: [
            MaterialButton(
              // onPressed: () async {
              //   await getData();
              //   setState(() {
              //     Get.toNamed('/qrres');
              //   });
              // },
              onPressed: () async {
                print("hello");
                var camerastatus = await Permission.camera.status;
                if (camerastatus.isGranted) {
                  print("object");
                  var cameraScanResult1 = await scanner.scan();
                  cameraScanResult = cameraScanResult1.toString();
                  Cuser.emailid = cameraScanResult;
                  idtosearch = cameraScanResult;
                  await getData();
                  Get.toNamed('/qrres');
                } else {
                  var isGranted = await Permission.camera.request();
                  if (isGranted.isGranted) {
                    var cameraScanResult1 = await scanner.scan();
                    cameraScanResult = cameraScanResult1.toString();
                    Cuser.emailid = cameraScanResult;
                    idtosearch = cameraScanResult;
                    await getData();
                    Get.toNamed('/qrres');
                  }
                }
              },
              child: Text("Scan"),
            ),
          ],
        ))),
      ),
    );
  }
}
