import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/components/size_widget.dart';
import 'package:loja_virtual/models/product.dart';
import 'package:loja_virtual/models/user_manager.dart';

import '../di.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String id = 'product_detail';
  final Product product;
  final UserManager userManager = getIt();

  ProductDetailScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: Carousel(
              autoplay: false,
              dotSize: 4,
              dotBgColor: Colors.transparent,
              dotSpacing: 15,
              dotColor: Theme.of(context).primaryColor,
              images: product.images.map((url) => NetworkImage(url)).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  product.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'A partir de',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),
                ),
                Text(
                  'R\$ 19.99',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Descrição',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Tamanhos',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: product.sizes.map((e) {
                    return SizeWidget(
                      size: e,
                      product: product,
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: product.selectedSize.value != null
                        ? () {
                            if (userManager.isLogged) {
                              // TODO: ADICIONAR AO CARRINHO
                            } else {
                              Navigator.of(context).pushNamed('/login');
                            }
                          }
                        : null,
                    color: primaryColor,
                    textColor: Colors.white,
                    child: Text(
                      userManager.isLogged
                          ? 'Adicionar ao Carrinho'
                          : 'Entre para Comprar ',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
