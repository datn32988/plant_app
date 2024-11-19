import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_app/entities/plant_entities.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/repository/plant_repo.dart';

class FirebasePlantRepo implements PlantRepo {
  final plantCollection = FirebaseFirestore.instance.collection('plant');

  Future<List<Plant>> getPlant() async {
    try {
      return await plantCollection.get().then((value) => value.docs
          .map((e) => Plant.fromEntity(PlantEntity.fromDocument(e.data())))
          .toList());
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
