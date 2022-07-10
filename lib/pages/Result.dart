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
