import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';


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
      backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if(CatalogModel.Items != null && CatalogModel.Items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(child: CircularProgressIndicator(),)

              ],
            ),
          ),
        ),
        );
  }
}


class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.Items.length,
      itemBuilder: (context,index){
        final catalog = CatalogModel.Items[index];
        return CatalogItem(catalog: catalog,);

      }, 
      );
  }
}

class CatalogItem extends StatelessWidget {
  
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(children: [
        CatalogImage(image: catalog.image),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkbluishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).color(MyTheme.darkbluishColor).make(),
            8.heightBox,
            OverflowBar(
              alignment: MainAxisAlignment.spaceBetween,
              spacing: 8.0,
              children: [
                "\$${catalog.price}".text.bold.xl.color(MyTheme.darkbluishColor).make(),
                Padding(
                  padding: EdgeInsets.zero,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(MyTheme.darkbluishColor),
                      shape: WidgetStatePropertyAll(StadiumBorder()),
                      ),
                     child: "Buy".text.make(),
                     ),
                )
              ],
            ).pOnly(right: 8)
          ],
        )),
      ],
    ),
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Catalog App".text.xl5.bold.color(MyTheme.darkbluishColor).make(),
                "Trending Products".text.xl2.make(),
                
              ],
            );
  }
}

class CatalogImage extends StatelessWidget {
   final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
   
    return Image.network(
      image,
      ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);

  }
}
























//appBar: AppBar(
        //   title: Text('Catalogue App'),
        // ),
        // body: Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: (CatalogModel.Items !=null &&  CatalogModel.Items.isNotEmpty)? 
        //   GridView.builder(
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       mainAxisSpacing: 16,
        //       crossAxisSpacing: 16,
        //       ),
        //      itemBuilder: (context,index){
        //       final item= CatalogModel.Items[index];
        //       return Card(
        //         clipBehavior: Clip.antiAlias,
        //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //         child: GridTile(
        //           header: Container(
        //             child: Text(item.name,style: TextStyle(color: Colors.white),),
        //             padding: EdgeInsets.all(12),
        //             decoration: BoxDecoration(
        //               color: Colors.deepPurple,
        //             ),
        //             ),
        //           child: Image.network(item.image),
        //           footer: Container(
        //             child: Text(item.price.toString(),style: TextStyle(color: Colors.white),),
        //             padding: EdgeInsets.all(12),
        //             decoration: BoxDecoration(
        //               color: Colors.black,
        //             ),
        //             ),
        //         )
        //       );
        //      },
        //       itemCount: CatalogModel.Items.length,
        //       )
        //   // ListView.builder(
        //   //   itemCount: CatalogModel.Items.length,
        //   //   itemBuilder: (context, index) {
        //   //     return ItemWidget(item: CatalogModel.Items[index], );
        //   //   },
           
        //   :Center(
        //     child: CircularProgressIndicator(),
        //     ),
        // ),
        //   drawer: MyDrawer(),