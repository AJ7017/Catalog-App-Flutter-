import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "assets/images/login_image.png",
            fit: BoxFit.cover
            ),
            SizedBox(
              height: 20
              ),
          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 24, 
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
                  height: 20
                ),
                ElevatedButton(
                  onPressed:() {
                    print("Welcome");
                  },
                  child: Text("Login"),
                  style: TextButton.styleFrom(),
                  ),
              ],
              
            ),
          ),



        ],
      )
    );
  }
}