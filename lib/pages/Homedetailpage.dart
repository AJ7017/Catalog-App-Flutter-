import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';


class Homedetailpage extends StatelessWidget {

  final Item catalog;

   const Homedetailpage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: OverflowBar(
                alignment: MainAxisAlignment.spaceBetween,
                spacing: 8.0,
                children: [
                  "\$${catalog.price}".text.bold.xl4.red800.color(MyTheme.darkbluishColor).make(),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(MyTheme.darkbluishColor),
                        shape: WidgetStatePropertyAll(StadiumBorder()),
                        ),
                       child: "Buy".text.xl.white.make(),
                       ).wh(100 , 50),
                  )
                ],
              ).p32(),
      ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
             Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
              ).h32(context),
              Expanded( child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(MyTheme.darkbluishColor).bold.make(),
                      catalog.desc.text.textStyle(context.captionStyle).xl.color(MyTheme.darkbluishColor).make(),
                      8.heightBox,
                    ],         
                  ).py64(),
                ),
              )
            ),
          ],
                ),
        ),
    );
  }
}