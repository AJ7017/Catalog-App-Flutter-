import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class Loginpage extends StatefulWidget {
  
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  
  String name="";
  bool changebutton= false;

  final _formkey= GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
     setState(() {
         changebutton=true;
       }
      );
                      
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebutton=false;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/welcome.png",
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        if (value!.length < 6) {
                          return 'Password length should be greater than 6 characters';
                        }
                        return null;
                      }, 
                    ),
                    SizedBox(
                      height: 40
                    ),
          
                    Material(
                      borderRadius: BorderRadius.circular(changebutton? 50:8),
                      color: Colors.deepPurple,
          
                      child: InkWell(
                        //splashColor: Colors.red,
                        onTap: () => moveToHome(context),
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
        ),
      )
    );
  }
}