part of 'main_screen_bloc.dart';

abstract class MainScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

final class MainScreenLoadinged extends MainScreenState {
  final List imageSliderItem;

  MainScreenLoadinged({required this.imageSliderItem});

  @override
  // TODO: implement props
  List<Object> get props => [imageSliderItem];
}

final class MainScreenInitial extends MainScreenState {}

final class MainScreenLoading extends MainScreenState {}

final class MainScreenError extends MainScreenState {
  final String error;

  MainScreenError({required this.error});

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
