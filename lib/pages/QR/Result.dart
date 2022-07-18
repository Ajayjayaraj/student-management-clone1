import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/utils/global.dart';

class QrResult extends StatefulWidget {
  const QrResult({super.key});
  @override
  State<QrResult> createState() => _QrResultState();
}

class _QrResultState extends State<QrResult> {
  @override
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('students');

  late var allData;
  Future<void> getData() async {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    Widget abcd(String s1, String s2) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text(
              s2 + " : ",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                // fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              s1,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Personal Details',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width *
                            0.075, // or whatever
                        color: Colors.black,
                      ),
                    ),
                  ),
                  abcd(CStudent.name, "Name"),
                  abcd(CStudent.email, "Email"),
                  abcd(CStudent.dob, "DOB"),
                  abcd(CStudent.phone, "Phone"),
                  abcd(CStudent.aadhaar, "Aadhaar"),
                  abcd(CStudent.address, "Address"),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                    child: Text(
                      'Academic Details',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width *
                            0.075, // or whatever
                        color: Colors.black,
                      ),
                    ),
                  ),
                  abcd(CStudent.admission, "Admission No"),
                  abcd(CStudent.dept, "Department"),
                  abcd(CStudent.year, "Year"),
                  abcd(CStudent.rank, "Entrance Rank"),
                ],
              ),
            ),
          ),
        ));
  }
}
