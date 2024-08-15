import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final imageURL="https://i.pinimg.com/564x/9d/98/56/9d9856055b44d55ace9c10e1ebb09ec1.jpg";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin:EdgeInsets.zero,
                accountName: Text("AJ",style: TextStyle(color: 
                  Colors.white)), 
                accountEmail: Text("AJ123@gmail.com",style: TextStyle(color: 
                  Colors.white)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageURL),
                ),
                ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                 color: Colors.white),
                 title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: 
                  Colors.white)),

            ),
             ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                 color: Colors.white),
                 title: Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: 
                  Colors.white)),

            ),
             ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                 color: Colors.white),
                 title: Text(
                  "Email",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: 
                  Colors.white)),

            ),
          ]
        
        ),
      ),
    );
  }
}