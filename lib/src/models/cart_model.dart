// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:store/src/models/product_model.dart';

class CartModel {
  int cartId;
  int quantity;
  ProductModel productModel;
  CartModel({
    required this.cartId,
    required this.quantity,
    required this.productModel,
  });
}
