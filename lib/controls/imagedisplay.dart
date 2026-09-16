import 'package:flutter/material.dart';

class ImgDisp extends StatefulWidget {
  const ImgDisp({super.key});

  @override
  State<ImgDisp> createState() => _ImgDispState();
}

class _ImgDispState extends State<ImgDisp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image
      (image: AssetImage('assets/images/image1.jpg'))),
    );
  }
}
