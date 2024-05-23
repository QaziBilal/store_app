// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'meatModel.dart';

class ProductModel {
  String name;
  String image;
  int price;
  List<MeatModel>? productImagelist;
  ProductModel(
      {required this.name,
      required this.image,
      required this.price,
      this.productImagelist});
}
