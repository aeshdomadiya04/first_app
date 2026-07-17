// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: const Text("Transform Widget"),
//           centerTitle: true,
//           backgroundColor: Colors.blue,
//         ),
//         body: Center(
//           child: Container( 
//             width: 300,
//             height: 300,
//             decoration: BoxDecoration(
//               color: Colors.red,
//               border: Border.all(color: Colors.black, width: 4),
//             ),
//             child: Stack(
//               alignment: Alignment.center,
//               children: [


//                 // Orange Diamond
//                 Transform.rotate(
//                   angle: pi / 4,
//                   child: Container(
//                     width: 210,
//                     height: 210,
//                     decoration: BoxDecoration(
//                       color: Colors.orange,
//                       border: Border.all(color: Colors.black, width: 4),
//                     ),
//                   ),
//                 ),

//                 // Green Square
//                 Container(
//                   width: 143,
//                   height: 143,
//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     border: Border.all(color: Colors.black, width: 4),
//                   ),
//                 ),

//                 // Blue Diamond
//                 Transform.rotate(
//                   angle: pi / 4, 
//                   child: Container( 
//                     width: 100,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       border: Border.all(color: Colors.black, width: 4),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }A
import 'package:flutter/material.dart';
import 'stopwatch/stopwatch_example.dart';

void main() {
  runApp(const StopwatchExample());
}

class StopwatchExample extends StatelessWidget {
  const StopwatchExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStopWatch(),
    );
  }
}