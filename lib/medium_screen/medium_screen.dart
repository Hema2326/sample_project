import 'package:flutter/material.dart';

class MediumScreen extends StatefulWidget {
  const MediumScreen({ Key? key }) : super(key: key);

  @override
  State<MediumScreen> createState() => _MediumScreenState();
}

class _MediumScreenState extends State<MediumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(color: Colors.yellow,)
    );
  }
}