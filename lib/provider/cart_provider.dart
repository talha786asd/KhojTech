import 'package:flutter/material.dart';
import 'package:khoj_tech/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += double.parse(cartItem.price!) * cartItem.quantity!;
    });
    return total;
  }

   addItem(
    int productId,
    String price,
    String title,
    String image,
  ) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
        (existingCartItem) => CartModel(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          image: existingCartItem.image,
          quantity: existingCartItem.quantity! + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartModel(
          id: null,
          title: title,
          price: price,
          image: image,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
