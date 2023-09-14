part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemovalEvent extends CartEvent {
  final ProductDataModel removedItem;

  CartRemovalEvent(this.removedItem);
}
