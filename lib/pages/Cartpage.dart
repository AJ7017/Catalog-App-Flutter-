import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class Cartpage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
        ),
      body: Column(
        children: [
          Cartlist().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl5.color(context.theme.colorScheme.primary).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not Supported yet".text.make()));
            },
            style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(context.theme.colorScheme.primary),
            ),
            child: "Buy".text.white.make()
          ).w32(context)
        ],
      )
    );
  }
}

class Cartlist extends StatefulWidget {

  @override
  State<Cartlist> createState() => _CartlistState();
}

class _CartlistState extends State<Cartlist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context,index) =>
       ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline)),
        title: "Item 1".text.make(),
       ),
      );
  }
}