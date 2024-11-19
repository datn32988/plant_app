import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/repository/plant_repo.dart';

part 'get_plant_event.dart';
part 'get_plant_state.dart';

class GetPlantBloc extends Bloc<GetPlantEvent, GetPlantState> {
  PlantRepo _plantRepo;

  GetPlantBloc(this._plantRepo) : super(GetPlantInitial()) {
    on<GetPlant>((event, emit) async {
      emit(GetPlantLoading());
      try {
        List<Plant> plants = await _plantRepo.getPlant();
        emit(GetPlantSuccess(plants: plants));
      } catch (e) {
        emit(GetPlantFailure());
      }
    });
  }
}
