import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter_bloc/data/cart_items.dart';
import 'package:ecommerce_flutter_bloc/features/home/model/product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemovalEvent>(cartRemovalEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemovalEvent(CartRemovalEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.removedItem);
    //emit cart removed state , that's scaffold messenger
    emit(CartSuccessState(cartItems: cartItems));
  }
}
