// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:project/utils/global.dart';
// import 'package:qrscan/qrscan.dart' as scanner;

// class QrScan extends StatefulWidget {
//   const QrScan({super.key});

//   @override
//   State<QrScan> createState() => _QrScanState();
// }

// class _QrScanState extends State<QrScan> {
//   @override
//   String cameraScanResult = "k";
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: Center(
//             child: Container(
//                 child: Column(
//           children: [
//             MaterialButton(
//               onPressed: () async {
//                 print("hello");
//                 var camerastatus = await Permission.camera.status;
//                 if (camerastatus.isGranted) {
//                   print("object");
//                   var cameraScanResult1 = await scanner.scan();
//                   cameraScanResult = cameraScanResult1.toString();
//                   Cuser.emailid = cameraScanResult;
//                   Get.toNamed('/qrres');
//                 } else {
//                   var isGranted = await Permission.camera.request();
//                   if (isGranted.isGranted) {
//                     var cameraScanResult1 = await scanner.scan();
//                     cameraScanResult = cameraScanResult1.toString();
//                     Cuser.emailid = cameraScanResult;
//                     Get.toNamed('/qrres');
//                   }
//                 }
//               },
//               child: Text("Scan"),
//             ),
//           ],
//         ))),
//       ),
//     );
//   }
// }
