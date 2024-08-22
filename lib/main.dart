import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/pages/Homepage.dart';
import 'package:flutter_application_1/pages/Loginpage.dart';
import 'package:flutter_application_1/pages/cartpage.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(
    store: MyStore(),
    child: myapp()));
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
      //home: HomePage(),
      themeMode: ThemeMode.system, //.light for light theme,.dark for dark theme
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
        initialRoute:  MyRoutes.loginRoute,
        routes:{
            '/':(context)=>Loginpage(),
            MyRoutes.homeRoute:(context)=>HomePage(),
            MyRoutes.loginRoute:(context)=>Loginpage(),
            MyRoutes.CartpageRoute:(context)=>Cartpage(),
        },
      );
  }
}