import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StudentFirst extends StatefulWidget {
  const StudentFirst({super.key});

  @override
  State<StudentFirst> createState() => _StudentFirstState();
}

class _StudentFirstState extends State<StudentFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('First Page'),
        actions: [
          IconButton(
              onPressed: (() {
                setState(() {
                  Get.toNamed('/login');
                  FirebaseAuth.instance.signOut();
                });
              }),
              icon: Icon(Icons.logout_outlined))
        ],
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () => Get.back(),
        // ),
      ),
      body: SafeArea(child: Center(child: Text("Hello"))),
    );
  }
}
