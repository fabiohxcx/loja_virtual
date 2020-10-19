class ItemSize {
  String name;
  num price;
  int stock;

  bool get hasStock => stock > 0;

  ItemSize.empty() {
    name = '';
    price = 0;
    stock = 0;
  }

  ItemSize.fromMap(Map<String, dynamic> map) {
    name = map['name'] as String ?? '';
    price = map['price'] as num ?? 0;
    stock = map['stock'] as int ?? 0;
  }

  @override
  String toString() {
    return 'name: $name price: $price stock: $stock';
  }
}
