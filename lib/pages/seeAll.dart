import 'package:flutter/material.dart';
import 'package:get/get.dart';

seeAll(var context){
  return showDialog(context: context, builder: ((context) => AlertDialog(
    elevation: 2,
    title: Text("See All",textAlign: TextAlign.center,),
    content: SingleChildScrollView(
      child: ListBody(
            children: [
              MaterialButton(
                color: Colors.cyan, //Color(0xffff2d55),
                elevation: 0,
                minWidth: 200,
                height: 50,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text("Registration"),
                onPressed: () {
                  Get.toNamed('/register');
                },
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.cyan, //Color(0xffff2d55),
                elevation: 0,
                minWidth: 200,
                height: 50,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text("Qr Generator"),
                onPressed: () {
                  Get.toNamed('/qrgenerator');
                },
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.cyan, //Color(0xffff2d55),
                elevation: 0,
                minWidth: 200,
                height: 50,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text("Qr Scan"),
                onPressed: () {
                  Get.toNamed('/qrscan');
                },
              ),
            ],
      ),
    ))));
}