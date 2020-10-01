import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import 'product.dart';

part 'product_manager.g.dart';

class ProductManager = _ProductManager with _$ProductManager;

abstract class _ProductManager with Store {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @observable
  List<Product> allProducts = [];

  @observable
  String _search = '';

  // ignore: unnecessary_getters_setters
  String get search => _search;

  // ignore: unnecessary_getters_setters
  set search(String value) => _search = value;

  _ProductManager() {
    _loadAllProducts();
  }

  List<Product> get filteredProducts {
    final List<Product> filteredProducts = [];
    if (search.isEmpty) {
      filteredProducts.addAll(allProducts);
    } else {
      filteredProducts.addAll(allProducts
          .where((product) => product.name.toLowerCase().contains(search.toLowerCase())));
    }

    return filteredProducts;
  }

  Future<void> _loadAllProducts() async {
    final snapProducts = await firebaseFirestore.collection('products').get();

    allProducts = snapProducts.docs.map((d) => Product.fromDocument(d)).toList();
  }
}
