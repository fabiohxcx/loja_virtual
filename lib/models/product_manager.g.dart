// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductManager on _ProductManager, Store {
  final _$allProductsAtom = Atom(name: '_ProductManager.allProducts');

  @override
  List<Product> get allProducts {
    _$allProductsAtom.reportRead();
    return super.allProducts;
  }

  @override
  set allProducts(List<Product> value) {
    _$allProductsAtom.reportWrite(value, super.allProducts, () {
      super.allProducts = value;
    });
  }

  @override
  String toString() {
    return '''
allProducts: ${allProducts}
    ''';
  }
}
