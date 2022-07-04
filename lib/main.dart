import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/pages/Result.dart';
import 'package:project/pages/qrgenerator.dart';
import 'package:project/pages/qrscan.dart';
import 'pages/Login.dart';
import 'pages/firstpage.dart';
import 'pages/homepage.dart';
import 'pages/registration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegistrationPage()),
        GetPage(name: '/first', page: () => FirstPage()),
        GetPage(name: '/qrgenerator', page: () => QrGenerator()),
        // GetPage(name: '/qrscan', page: () => QrScan()),
        GetPage(name: '/qrres', page: () => QrResult())
      ],
    );
  }
}
