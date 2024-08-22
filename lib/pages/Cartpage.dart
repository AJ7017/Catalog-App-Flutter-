import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
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
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              builder: (context, state , VxStatus) {
                return "\$${_cart.Totalprice}"
                 .text
                 .xl5
                 .color(context.theme.colorScheme.primary)
                 .make();
              },
               mutations: {RemoveMutation}
               ),
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

class Cartlist extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () => RemoveMutation(_cart.items[index]),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}