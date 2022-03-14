

import 'package:flutter/material.dart';
import 'package:sample_project/large_screen/large_screen.dart';
import 'package:sample_project/medium_screen/medium_screen.dart';
import 'package:sample_project/screens/custom_screen/custom_screen.dart';
import 'package:sample_project/small_screen/small_screen.dart';
import 'package:sample_project/widgets/responsive_widget.dart';

class ResponsiveWeb extends StatefulWidget {
  const ResponsiveWeb({ Key? key }) : super(key: key);

  @override
  State<ResponsiveWeb> createState() => _ResponsiveWebState();
}

class _ResponsiveWebState extends State<ResponsiveWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:  
       Container(
       
            child:  const ResponsiveWidget(largeScreen: LargeScreen(), mediumScreen: MediumScreen(), smallScreen: SmallScreen(), customScreen: CustomScreen()),
          
            ));
    
  }
}