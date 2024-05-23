// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:store/src/models/product_model.dart';

class CategoryModel {
  String name;
  String image;
  String icon;
  Color color;
  List<ProductModel> productModel;
  CategoryModel({
    required this.name,
    required this.image,
    required this.icon,
    required this.color,
    required this.productModel,
  });
}
