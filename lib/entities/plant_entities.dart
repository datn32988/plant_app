class PlantEntity {
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

  PlantEntity({
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
  Map<String, Object?> toDocument() {
    return {
      'plantId': plantId,
      'imageUrl': imageUrl,
      'isVeg': isVeg,
      'spicy': spicy,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'size': size,
      'height': height
    };
  }

  static PlantEntity fromDocument(Map<String, dynamic> doc) {
    return PlantEntity(
        plantId: doc['plantId'],
        imageUrl: doc["imageUrl"],
        isVeg: doc["isVeg"],
        spicy: doc["spicy"],
        name: doc["name"],
        description: doc["description"],
        price: doc["price"],
        discount: doc["discount"],
        size: doc["size"],
        height: doc["height"]);
  }
}
