import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import 'product.dart';

part 'product_manager.g.dart';

class ProductManager = _ProductManager with _$ProductManager;

abstract class _ProductManager with Store {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @observable
  List<Product> allProducts;

  _ProductManager() {
    _loadAllProducts();
  }

  Future<void> _loadAllProducts() async {
    final snapProducts = await firebaseFirestore.collection('products').get();

    allProducts = snapProducts.docs.map((d) => Product.fromDocument(d)).toList();
  }
}
