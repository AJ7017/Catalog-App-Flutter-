import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {


    //int day1=30;
    //double days=30;
    //String name="aj";
    //bool exists=true;
    //num temp=30.5; //can hold both int and double

    //var daytoday="TUESDAY"; //compiler assigns data type
    //const pi=3.14; //data cannot be modified
    //final pi2=3.14; //like constant but data can be modified
    //i.e we have a list if it is const it cannot be modified while vice versa if it is final


    return MaterialApp(
      home: HomePage(),
      );
  }
}