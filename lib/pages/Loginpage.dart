import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class Loginpage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
              //height: 300,
              ),
              SizedBox(
                height: 20
                ),
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 28, 
                fontWeight: FontWeight.bold 
              ),
            ),
            SizedBox(
              height: 20
              ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                   decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "Enter Username"
                    ),
                  ),
              
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Password"
                    ),   
                  ),
                  SizedBox(
                    height: 40
                  ),
                  ElevatedButton(
                    onPressed:() {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Text("Login"),
                    style: TextButton.styleFrom(minimumSize: Size(150,40)),
                    ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}