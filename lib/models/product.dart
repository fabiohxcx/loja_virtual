import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:loja_virtual/models/item_size.dart';

class Product {
  Product.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.get('name') as String;
    description = document.get('description') as String;
    images = List<String>.from(document.get('images') as List<dynamic>);
    try {
      sizes = (document.get('sizes') as List<dynamic>)
          .map((e) => ItemSize.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      sizes = null;
    }
  }

  String id;
  String name;
  String description;
  List<String> images;
  List<ItemSize> sizes;
  var selectedSize = Rx<ItemSize>();
}
