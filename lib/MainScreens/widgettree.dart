import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/First Page/firstpage.dart';
import '../pages/First Page/studentfirst.dart';
import '../pages/QR/Result.dart';
import '../pages/QR/qrgenerator.dart';
import '../pages/Registration/Login.dart';
import '../pages/homepage.dart';
import '../pages/Registration/registration.dart';

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
      // GetPage(name: '/qrscan', page: () => QrScan()),
      GetPage(name: '/qrres', page: () => QrResult()),
      GetPage(name: '/studentfirst', page: (() => StudentFirst())),
    ],
  );
}
