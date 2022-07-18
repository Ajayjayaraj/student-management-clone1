import 'package:flutter/material.dart';
import 'package:project/utils/global.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  @override
  String qrData = "";
  TextEditingController qrtext = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          // shrinkWrap: true,
          children: <Widget>[
            (qrData != "")
                ? QrImage(
                    data: qrData,
                  )
                : (Text("")),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "QR Code Generator",
              style: TextStyle(fontSize: 20.0),
            ),
            TextField(
              controller: qrtext,
              decoration: InputDecoration(
                hintText: "Input your link or data",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: MaterialButton(
                padding: EdgeInsets.all(15.0),
                onPressed: () async {
                  setState(() {
                    qrData = CStudent.admission;

                    if (qrtext.text != "") qrData = qrtext.text;
                  });
                },
                child: Text(
                  "Generate QR",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
