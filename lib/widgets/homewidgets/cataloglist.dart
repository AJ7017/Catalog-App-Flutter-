import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/Homedetailpage.dart';
import 'package:flutter_application_1/widgets/homewidgets/Addtocart.dart';
import 'package:flutter_application_1/widgets/homewidgets/catalogimage.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.Items.length,
      itemBuilder: (context,index){
        final catalog = CatalogModel.Items[index];
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Homedetailpage(catalog: catalog,))),
          child: CatalogItem(catalog: catalog,),
          );

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
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image)),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(context.accentColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).color(Theme.of(context).colorScheme.secondary).make(),
            8.heightBox,
            OverflowBar(
              alignment: MainAxisAlignment.spaceBetween,
              spacing: 8.0,
              children: [
                "\$${catalog.price}".text.bold.xl.color(Theme.of(context).colorScheme.primary).make(),
                Addtocart(catalog: catalog),
                Padding(
                  padding: EdgeInsets.zero,
                  
                )
              ],
            ).pOnly(right: 8)
          ],
        )),
      ],
    ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

