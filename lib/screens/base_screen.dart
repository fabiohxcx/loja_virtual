import 'package:flutter/material.dart';
import 'package:loja_virtual/components/custom_drawer.dart';
import 'package:loja_virtual/screens/products_screen.dart';

import '../di.dart';

class BaseScreen extends StatelessWidget {
  static const String id = 'base';
  final PageController pageController = getIt();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          drawer: CustomDrawer(),
        ),
        ProductsScreen(),
        Scaffold(
          appBar: AppBar(
            title: const Text('Hom2'),
          ),
          drawer: CustomDrawer(),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text('Home3'),
          ),
          drawer: CustomDrawer(),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text('Home4'),
          ),
          drawer: CustomDrawer(),
        ),
      ],
    );
  }
}
