import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          'Login Page',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.blue,
            fontWeight: FontWeight.bold
          ),
           ),
      ),
    );
  }
}