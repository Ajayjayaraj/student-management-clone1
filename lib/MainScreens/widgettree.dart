import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/pages/Result.dart';
import 'package:project/pages/qrgenerator.dart';
import 'package:project/pages/qrscan.dart';
import 'package:project/pages/studentfirst.dart';
import '../pages/Login.dart';
import '../pages/firstpage.dart';
import '../pages/homepage.dart';
import '../pages/registration.dart';

Widget Decider(String page) {
  return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: page,
    getPages: [
      GetPage(name: '/', page: () => HomePage()),
      GetPage(name: '/login', page: () => LoginPage()),
      GetPage(name: '/register', page: () => RegistrationPage()),
      GetPage(name: '/first', page: () => FirstPage()),
      GetPage(name: '/qrgenerator', page: () => QrGenerator()),
      GetPage(name: '/qrscan', page: () => QrScan()),
      GetPage(name: '/qrres', page: () => QrResult()),
      GetPage(name: '/studentfirst', page: (() => StudentFirst())),
    ],
  );
}
