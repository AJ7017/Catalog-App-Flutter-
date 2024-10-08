import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{

  //catalog field
   CatalogModel _catalog=CatalogModel();

  // Collection of IDs - store Ids of each Item
  final List<int> Itemids=[];

  //get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
   List<Item> get items => Itemids.map<Item>((id) => _catalog.getbyId(id)).toList();


   //get total price
   num get Totalprice => items.fold(0, (total, current) => total + current.price);

}

class AddMutation extends VxMutation<MyStore>{
   final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart.Itemids.add(item.id);
  }

}

class RemoveMutation extends VxMutation<MyStore>{
   final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart.Itemids.remove(item.id);
  }

}