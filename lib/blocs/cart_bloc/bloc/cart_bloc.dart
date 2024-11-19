import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_app/models/plant.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddToCart>((event, emit) {
      final updatedPlants = List<Plant>.from(state.plants)..add(event.plants);
      emit(CartState(plants: updatedPlants));
    });
    on<RemovePlant>((event, emit) {
      final updatedProducts = List<Plant>.from(state.plants)
        ..remove(event.plants);
      emit(CartState(plants: updatedProducts));
    });

    on<ClearCart>((event, emit) {
      emit(const CartState(plants: []));
    });
  }
}
