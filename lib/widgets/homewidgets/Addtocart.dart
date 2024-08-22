import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class Addtocart extends StatelessWidget {
   final Item catalog;
   Addtocart({
    Key? key,
    required this.catalog,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    VxState.watch(context, on: [AddMutation , RemoveMutation]);
    

    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart= _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: (){
        
        if(!isInCart){
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
        shape: WidgetStatePropertyAll(StadiumBorder()),
        ),
       child: isInCart? Icon(Icons.done,color: Theme.of(context).colorScheme.secondary) : Icon(CupertinoIcons.cart_badge_plus, color: Theme.of(context).colorScheme.secondary,),
       );
  }
}
