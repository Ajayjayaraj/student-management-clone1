import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/utils/global.dart';

class QrResult extends StatefulWidget {
  const QrResult({super.key});

  @override
  State<QrResult> createState() => _QrResultState();
}

class _QrResultState extends State<QrResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text(Cuser.emailid),
      ),
    );
  }
}
