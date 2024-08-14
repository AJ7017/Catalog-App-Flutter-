import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class Loginpage extends StatefulWidget {
  
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  
  String name="";
  bool changebutton= false;

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
              "Welcome $name",
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
                    onChanged: (value){
                      name=value;
                      setState(() {
                        
                      });
                    },
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

                  InkWell(
                    onTap: () async { 
                      setState(() {
                        changebutton=true;
                      });

                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changebutton? 50:150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changebutton
                      ? Icon(
                        Icons.done,
                        color: Colors.white,
                        )
                      : Text(
                        "Login",
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                           ),
                        ),
                    
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(changebutton? 50:8)
                        ),
                    
                    ),
                  ),



                  // ElevatedButton(
                  //   onPressed:() {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   child: Text("Login"),
                  //   style: TextButton.styleFrom(minimumSize: Size(150,40)),
                  //   ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}