import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/components/custom_drawer.dart';
import 'package:loja_virtual/components/product_list_tile.dart';
import 'package:loja_virtual/models/product_manager.dart';

import '../di.dart';

class ProductsScreen extends StatelessWidget {
  static const String id = 'products';

  const ProductsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductManager productManager = getIt();
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: productManager.allProducts.length,
            itemBuilder: (_, index) {
              return ProductListTile(product: productManager.allProducts[index]);
            });
      }),
    );
  }
}
