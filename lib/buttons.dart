
// This file contains the code for the custom button widget that is used in the calculator app.

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  
 
  final color;
  
  final textColor;
  final String buttonText;
  final buttonTapped;
  final bool isDouleWidth;



  
   const  MyButton( {super.key,  this.color, this.textColor, required this.buttonText, this.buttonTapped, this.isDouleWidth = false, });

  @override

  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: color,
      child: Center(
        child: Text(
          buttonText, 
          style: TextStyle(color: textColor, fontSize: 20
          ),
        ),
      ),
      ),
    ),
      )
    );
  }
}