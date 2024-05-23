// ignore_for_file: public_member_api_docs, sort_constructors_first
class MeatModel {
  String image;
  String name;
  MeatModel({
    required this.image,
    required this.name,
  });
}

List<MeatModel> meat = [
  MeatModel(image: "assets/images/chest.png", name: "Chest"),
  MeatModel(image: "assets/images/kaleji.jpg", name: "Kaleji"),
  MeatModel(image: "assets/images/leg.png", name: "Leg"),
  MeatModel(image: "assets/images/heart.jpg", name: "Heart"),
];
