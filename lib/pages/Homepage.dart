import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatelessWidget {

  
  
  @override
  Widget build(BuildContext context) {
      final dummyList = List.generate(20, (index) => CatalogModel.Items[0]);
    return Scaffold(
        appBar: AppBar(
          title: Text('Catalogue App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(item: dummyList[index], );
            },
          ),
        ),
          drawer: MyDrawer(),
        );
  }

  //constraints go down , sizes go up , parent sets position
  // in functions you can use optional parameters with curly braces which are used to give default values
  // '@required' before value can be used to make a parameter in function must to be given value
  //in flutter things are in tree like hierarchy where context is used to tell location of any component of tree

}