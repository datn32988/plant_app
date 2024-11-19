import 'package:plant_app/models/plant.dart';

abstract class PlantRepo {
  Future<List<Plant>> getPlant();
}
