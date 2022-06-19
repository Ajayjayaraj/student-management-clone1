import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:project/utils/styles.dart';

import 'addons.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _regbutton() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: _emailController.text, password: "123456");
      users
          .add({
            'Name': _nameController.text,
            'emailid': _emailController.text,
            'password': "123456"
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      toast_s("Registration Sucessful", context);
      Get.toNamed('/login');
    } catch (e) {
      String error;
      error = e.toString();
      int kpp = error.lastIndexOf(']') + 1;
      toast(error.substring(kpp), context);
    }
    ;
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(23),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'All Fields marked aestriks(*) are mandatory.',
                  style: TextStyle(
                    fontSize: 13, // or whatever
                    color: Colors.red,
                  ),
                ),
              ),
              // inputdec("Admission Number*", Icons.person_sharp),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: _nameController,
                  style: inputstyle(),
                  decoration: inputdec("Name*", Icons.person_outline)),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: _emailController,
                  style: inputstyle(),
                  decoration: inputdec("Email*", Icons.person_outline)),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () => _regbutton(),
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'SFUIDisplay',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                disabledColor: Colors.grey[300],
                color: Colors.cyan, //Color(0xffff2d55),
                elevation: 0,
                minWidth: 400,
                height: 50,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(23),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'All Fields marked aestriks(*) are mandatory.',
                  style: TextStyle(
                    fontSize: 13, // or whatever
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: _nameController,
                  style: inputstyle(),
                  decoration: inputdec("Name*", Icons.person_outline)),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: _emailController,
                  style: inputstyle(),
                  decoration: inputdec("Email*", Icons.person_outline)),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () => _regbutton(),
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'SFUIDisplay',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                disabledColor: Colors.grey[300],
                color: Colors.cyan, //Color(0xffff2d55),
                elevation: 0,
                minWidth: 400,
                height: 50,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed('/');
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Stack(children: <Widget>[
        CachedNetworkImage(
          imageUrl:
              "https://cdn.pixabay.com/photo/2019/03/21/15/51/chatbot-4071274_960_720.jpg",
        ),
        _widgetOptions.elementAt(_selectedIndex),
      ])),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Student',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Teacher',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
