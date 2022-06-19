import 'package:flutter/material.dart';

toast(String a, var cont) => showDialog(
      context: cont,
      builder: (ctx) => AlertDialog(
        elevation: 3,
        title: Text(
          a,
          textAlign: TextAlign.center,
        ),
        content: Icon(
          Icons.remove_circle_outline,
          size: 80,
          color: Colors.red,
        ),
      ),
    );

toast_s(String a, var cont) => showDialog(
      context: cont,
      builder: (ctx) => AlertDialog(
        elevation: 3,
        title: Text(
          a,
          textAlign: TextAlign.center,
        ),
        content: Icon(
          Icons.check_circle_outline_outlined,
          size: 80,
          color: Colors.green,
        ),
      ),
    );
