part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<Plant> plants;

  const CartState({this.plants = const <Plant>[]});

  @override
  List<Object> get props => [plants];
}
