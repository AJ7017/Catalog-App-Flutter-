import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/homewidgets/Addtocart.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: OverflowBar(
                alignment: MainAxisAlignment.spaceBetween,
                spacing: 8.0,
                children: [
                  "\$${catalog.price}".text.bold.xl4.red800.color(Theme.of(context).colorScheme.primary).make(),
                  Addtocart(catalog: catalog).wh(120,50),
                  Padding(
                    padding: EdgeInsets.zero,
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
                edge: VxEdge.top,
                child: Container(
                  color:  context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(context.accentColor).bold.make(),
                      catalog.desc.text.textStyle(context.captionStyle).xl.color(context.accentColor).make(),
                      10.heightBox,
                      "Consetetur sit dolor lorem consetetur vero dolor sit eirmod eos. Sit amet sea clita et. Ipsum et duo et tempor takimata ut takimata. Kasd elitr diam duo accusam sit consetetur eirmod dolore, invidunt ut eos invidunt dolores duo est magna sed. Eos gubergren elitr no ipsum kasd sadipscing duo lorem." .text.color(context.accentColor).make().p16(),  
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