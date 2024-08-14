import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Catalogue App')
        ),
        body:Center(
          child: Container(
            child: Text('Welcome to my app '),
            ),
          ),
          drawer: Drawer(),
        );
  }


  // in functions you can use optional parameters with curly braces which are used to give default values
  // '@required' before value can be used to make a parameter in function must to be given value
  //in flutter things are in tree like hierarchy where context is used to tell location of any component of tree

}