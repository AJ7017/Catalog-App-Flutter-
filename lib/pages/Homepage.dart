import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';


class HomePage extends StatefulWidget {
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    super.initState();
    loadData();
  }
  
  loadData() async{
    final catalogJson=await rootBundle.loadString("assets/files/catalog.json"); 
    final decodedData=jsonDecode(catalogJson);
    var productsData=decodedData["products"];
    CatalogModel.Items=List.from(productsData).map<Item>((item)=>Item.fromMap(item)).toList();
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
        appBar: AppBar(
          title: Text('Catalogue App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.Items !=null &&  CatalogModel.Items.isNotEmpty)? 
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              ),
             itemBuilder: (context,index){
              final item= CatalogModel.Items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: GridTile(
                  header: Container(
                    child: Text(item.name,style: TextStyle(color: Colors.white),),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                    ),
                  child: Image.network(item.image),
                  footer: Container(
                    child: Text(item.price.toString(),style: TextStyle(color: Colors.white),),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    ),
                )
              );
             },
              itemCount: CatalogModel.Items.length,
              )
          // ListView.builder(
          //   itemCount: CatalogModel.Items.length,
          //   itemBuilder: (context, index) {
          //     return ItemWidget(item: CatalogModel.Items[index], );
          //   },
           
          :Center(
            child: CircularProgressIndicator(),
            ),
        ),
          drawer: MyDrawer(),
        );
  }
  
 
}