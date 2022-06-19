import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _nameController,
          ),
          TextField(
            controller: _emailController,
          ),
          ElevatedButton(
            child: Text("Register"),
            onPressed: () async {
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
              } catch (e) {
                print(e);
              }
            },
          )
        ],
      )),
    );
  }
}
