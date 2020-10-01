import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/components/custom_drawer.dart';
import 'package:loja_virtual/components/product_list_tile.dart';
import 'package:loja_virtual/components/search_dialog.dart';
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
        title: Observer(builder: (_) {
          if (productManager.search.isEmpty) {
            return const Text('Products');
          } else {
            return LayoutBuilder(builder: (_, constraints) {
              return GestureDetector(
                onTap: () async {
                  final search = await showDialog<String>(
                      context: context,
                      builder: (_) => SearchDialog(
                            initialText: productManager.search,
                          ));
                  if (search != null) {
                    productManager.search = search;
                  }
                },
                child: Container(
                    width: constraints.biggest.width,
                    child: Text(
                      productManager.search,
                      textAlign: TextAlign.center,
                    )),
              );
            });
          }
        }),
        centerTitle: true,
        actions: <Widget>[
          Observer(builder: (_) {
            if (productManager.search.isEmpty) {
              return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context, builder: (_) => const SearchDialog());
                    if (search != null) {
                      productManager.search = search;
                    }
                  });
            } else {
              return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    productManager.search = '';
                  });
            }
          })
        ],
      ),
      body: Observer(builder: (_) {
        final filteredProducts = productManager.filteredProducts;
        return ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: filteredProducts.length,
            itemBuilder: (_, index) {
              return ProductListTile(product: filteredProducts[index]);
            });
      }),
    );
  }
}
