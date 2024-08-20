import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
   static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        colorScheme: ColorScheme.light(
        primary: darkbluishColor,
        secondary: darkbluishColor),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
           titleTextStyle:  TextStyle(
             color: Colors.black,    
             fontWeight: FontWeight.bold,
             ),
             centerTitle: true,
        )
      );

    static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkbgColor,
        colorScheme: ColorScheme.dark(
        primary: darkfgColor,
        secondary: Colors.white),
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle:  TextStyle(
             color: Colors.white,    
             fontWeight: FontWeight.bold,
             ),
          centerTitle: true,
        )
      );

      //colors
      static Color creamColor = Color(0xfff5f5f5);
      static Color darkbgColor = Vx.gray900;
      static Color darkbluishColor = Color(0xff403b58);
      static Color darkfgColor = Vx.indigo300;
}