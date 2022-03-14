import 'package:flutter/material.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({ Key? key }) : super(key: key);

  @override
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(color: Colors.red),
    );
  }
}