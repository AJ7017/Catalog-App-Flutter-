import 'package:flutter_application_1/models/catalog.dart';

class CartModel{

  //catalog field
  late CatalogModel _catalog;

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
   num get Totalprice => items.fold(0, (total,current)=>total+current.price);

   //Add Item
   void additem(Item item) {
    Itemids.add(item.id);
   }

   //Remove Item
   void removeitem(Item item) {
    Itemids.remove(item.id);
   }
}