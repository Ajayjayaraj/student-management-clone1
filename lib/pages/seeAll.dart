import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'QR/qrscan.dart';

Widget wid(String text, Function fn) {
  return MaterialButton(
    color: Colors.cyan, //Color(0xffff2d55),
    elevation: 0,
    minWidth: 200,
    height: 50,
    textColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Text("$text"),
    onPressed: () => fn(),
  );
}

seeAll(var context) {
  var sizedboxlength = MediaQuery.of(context).size.width * 0.06;
  return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
          elevation: 2,
          title: Text(
            "See All",
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                wid("Registration", () {
                  Get.toNamed('/register');
                  Navigator.pop(context);
                }),
                SizedBox(
                  height: sizedboxlength,
                ),
                wid("QR Generator", () {
                  Get.toNamed('/qrgenerator');
                  Navigator.pop(context);
                }),
                SizedBox(
                  height: sizedboxlength,
                ),
                wid("QR Scanner", () {
                  qrfn();
                  Navigator.pop(context);
                }),
                SizedBox(
                  height: sizedboxlength,
                ),
                wid("QR Biometry", () {
                  Get.toNamed('/qrbio');
                  Navigator.pop(context);
                }),
              ],
            ),
          ))));
}
