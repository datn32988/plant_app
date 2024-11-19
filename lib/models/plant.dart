import 'package:plant_app/entities/plant_entities.dart';

class Plant {
  String plantId;
  String imageUrl;
  bool isVeg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  String size;
  int height;

  Plant({
    required this.plantId,
    required this.imageUrl,
    required this.isVeg,
    required this.spicy,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.size,
    required this.height,
  });

  PlantEntity toEntiy() {
    return PlantEntity(
      plantId: plantId,
      imageUrl: imageUrl,
      isVeg: isVeg,
      spicy: spicy,
      name: name,
      description: description,
      price: price,
      discount: discount,
      size: size,
      height: height,
    );
  }

  static Plant fromEntity(PlantEntity entity) {
    return Plant(
      plantId: entity.plantId,
      imageUrl: entity.imageUrl,
      isVeg: entity.isVeg,
      spicy: entity.spicy,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      discount: entity.discount,
      size: entity.size,
      height: entity.height,
    );
  }
}
