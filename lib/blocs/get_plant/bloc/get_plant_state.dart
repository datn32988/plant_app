part of 'get_plant_bloc.dart';

sealed class GetPlantState extends Equatable {
  const GetPlantState();

  @override
  List<Object> get props => [];
}

final class GetPlantInitial extends GetPlantState {}

final class GetPlantFailure extends GetPlantState {}

final class GetPlantLoading extends GetPlantState {}

final class GetPlantSuccess extends GetPlantState {
  final List<Plant> plants;

  GetPlantSuccess({required this.plants});

  @override
  // TODO: implement props
  List<Object> get props => [plants];
}
