import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
          ),
          TextField(
            controller: _passwordController,
          ),
          ElevatedButton(
              onPressed: () async {
                // print(_emailController.toString() +
                //     " " +
                //     _passwordController.toString());
                try {
                  await _firebaseAuth
                      .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text)
                      .then((value) => print('Login Successful'));
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegistrationPage()));
                } catch (e) {
                  print(e);
                }
              },
              child: Text("Submit"))
        ],
      )),
    );
  }
}
