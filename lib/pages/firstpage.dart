import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/pages/qrgenerator.dart';
import 'package:project/utils/global.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              child: Text("Print"),
              onPressed: () {
                print(Cuser.name);
              },
            )
          ],
        )),
      ),
    );
  }
}
