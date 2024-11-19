part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class AddToCart extends CartEvent {
  final Plant plants;
  AddToCart({required this.plants});

  @override
  // TODO: implement props
  List<Object> get props => [plants];
}

class RemovePlant extends CartEvent {
  final Plant plants;

  RemovePlant({required this.plants});

  @override
  List<Object> get props => [plants];
}

class ClearCart extends CartEvent {}
