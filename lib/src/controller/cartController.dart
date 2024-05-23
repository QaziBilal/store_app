import 'package:flutter/material.dart';
import 'package:store/src/models/product_model.dart';

import '../models/cart_model.dart';

class CartController extends ChangeNotifier {
  int _quantity = 1;
  int get quantity => _quantity;

  List<CartModel> _cartList = [];
  List<CartModel> get cartList => _cartList;

  bool isloading = false;

  void updateQuantity(bool updateAction) {
    if (updateAction == true) {
      if (_quantity > 20) {
      } else {
        _quantity++;
      }
    } else {
      if (_quantity < 1) {
      } else {
        _quantity--;
      }
    }
    notifyListeners();
  }

  void clearList() {
    _cartList.clear();
    notifyListeners();
  }

  void setCartListItems(ProductModel foodItem, cartId) {
    for (var cartItem in cartList) {
      if (cartItem.productModel == foodItem) {
        cartItem.quantity++;
        notifyListeners();
        return;
      }
    }
    CartModel cartItem = CartModel(
      cartId: cartId,
      quantity: _quantity,
      productModel: foodItem,
    );

    _cartList.add(cartItem);
    _quantity = 1;
    notifyListeners();
  }

  void updateQuantityinCartList(bool update, index) {
    if (update == true) {
      if (_cartList[index].quantity > 4) {
      } else {
        _cartList[index].quantity++;
      }
    } else {
      if (_cartList[index].quantity < 2) {
      } else {
        _cartList[index].quantity--;
      }
    }

    notifyListeners();
  }

  void removeCartItem(CartModel cartModel) {
    _cartList.remove(cartModel);
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var cartItem in _cartList) {
      int price = cartItem.quantity * cartItem.productModel.price;

      totalPrice += price;
    }

    return totalPrice;
  }
}
