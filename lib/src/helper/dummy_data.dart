import 'package:store/src/helper/constants.dart';
import 'package:store/src/models/category_model.dart';
import 'package:store/src/models/product_model.dart';
import 'package:store/src/models/meatModel.dart';

List<CategoryModel> categoriesList = [
  CategoryModel(
      name: "Fruits",
      image: AppImages.fruits,
      icon: AppImages.fruit1,
      color: AppColors.fruits,
      productModel: fruitList),
  CategoryModel(
      name: "Vegetables",
      image: AppImages.vegetables,
      icon: AppImages.veges1,
      color: AppColors.vegs,
      productModel: vegetableList),
  CategoryModel(
      name: "Seeds",
      image: AppImages.seeds,
      icon: AppImages.seed1,
      color: AppColors.seed,
      productModel: seedList),
  CategoryModel(
      name: "Sweets",
      image: AppImages.sweets,
      icon: AppImages.pastries1,
      color: AppColors.pastries,
      productModel: sweetsList),
  CategoryModel(
      name: "Meat",
      image: AppImages.meat,
      icon: AppImages.meat1,
      color: AppColors.meat,
      productModel: meatList),
  CategoryModel(
      name: "Spices",
      image: AppImages.spices,
      icon: AppImages.spcices1,
      color: AppColors.spice,
      productModel: spicesList),
];

List<ProductModel> fruitList = [
  ProductModel(name: "Apple", image: AppImages.apple, price: 220),
  ProductModel(name: "Mango", image: AppImages.mango, price: 120),
  ProductModel(name: "Bnana", image: AppImages.bnana, price: 80),
  ProductModel(name: "Pineapple", image: AppImages.pineappble, price: 300),
  ProductModel(name: "Orange", image: AppImages.orange, price: 120),
  ProductModel(name: "Grapes", image: AppImages.grapes, price: 220),
];

List<ProductModel> vegetableList = [
  ProductModel(name: "Bhindi", image: AppImages.bhindi, price: 110),
  ProductModel(name: "Kadu", image: AppImages.kadu, price: 90),
  ProductModel(name: "Shimla", image: AppImages.shimla, price: 70),
  ProductModel(name: "Baingan", image: AppImages.baingan, price: 60),
];

List<ProductModel> sweetsList = [
  ProductModel(name: "Barfi", image: AppImages.barfi, price: 400),
  ProductModel(name: "Gulab Jamun", image: AppImages.gulabjaman, price: 420),
  ProductModel(name: "Ice Cream", image: AppImages.iceCream, price: 460),
  ProductModel(name: "Jalebi", image: AppImages.jalebi, price: 480),
  ProductModel(name: "Rasgulla", image: AppImages.rasgulla, price: 500),
  ProductModel(name: "Laddu", image: AppImages.laddu, price: 200),
];

List<ProductModel> spicesList = [
  ProductModel(name: "Black Mirch", image: AppImages.blackMirch, price: 1200),
  ProductModel(name: "Chat Masala", image: AppImages.chatMasala, price: 1300),
  ProductModel(name: "Garam Masala", image: AppImages.garamMasala, price: 1000),
  ProductModel(name: "Red Chili Powder", image: AppImages.redChili, price: 900),
];

List<ProductModel> seedList = [
  ProductModel(name: "Badam", image: AppImages.badam, price: 2000),
  ProductModel(name: "Chilghoza", image: AppImages.chilghoza, price: 1350),
  ProductModel(name: "Kaju", image: AppImages.kaju, price: 2340),
  ProductModel(name: "Peanuts", image: AppImages.peanuts, price: 456),
  ProductModel(name: "Walnuts", image: AppImages.walnuts, price: 3212),
];

List<ProductModel> meatList = [
  ProductModel(
      name: "Cow", image: AppImages.cow, price: 1700, productImagelist: meat),
  ProductModel(name: "Deer", image: AppImages.deer, price: 8000),
  ProductModel(name: "Duck", image: AppImages.duck, price: 1300),
  ProductModel(name: "Goat", image: AppImages.goat, price: 1900),
  ProductModel(name: "Hen", image: AppImages.hen, price: 540),
  ProductModel(name: "Rabbit", image: AppImages.rabbit, price: 1120),
];
