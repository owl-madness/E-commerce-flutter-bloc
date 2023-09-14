import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter_bloc/data/cart_items.dart';
import 'package:ecommerce_flutter_bloc/data/grocery_data.dart';
import 'package:ecommerce_flutter_bloc/data/wishlist_items.dart';
import 'package:ecommerce_flutter_bloc/features/home/model/product_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomePageInitialFetchEvent>(homePageInitialFetchEvent);

    on<HomeProductsWishlistButtonClickedEvent>(
        homeProductsWishlistButtonClickedEvent);

    on<HomeProductsCartButtonClickedEvent>(homeProductsCartButtonClickedEvent);

    on<HomeWishlistNavigateButtonClickedEvent>(
        homeWishlistNavigateButtonClickedEvent);

    on<HomeCartNavigateButtonClickedEvent>(homeCartNavigateButtonClickedEvent);
  }

  FutureOr<void> homePageInitialFetchEvent(
      HomePageInitialFetchEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(GroceryProducts.sampleData
        .map((e) => ProductDataModel(
            id: e['id'],
            description: e['description'],
            images: e['images'],
            name: e['name'],
            price: e['price'],
            quantity: e['quantity']))
        .toList()));
  }

  FutureOr<void> homeProductsCartButtonClickedEvent(
      HomeProductsCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedState());
    if (kDebugMode) {
      print('Cart button clicked');
      print('whole cartlist ${cartItems.length}');
    }
  }

  FutureOr<void> homeProductsWishlistButtonClickedEvent(
      HomeProductsWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedState());
    if (kDebugMode) {
      print('wish list button clicked');
      print('whole wishlist ${wishlistItems.length}');
    }
  }

  FutureOr<void> homeWishlistNavigateButtonClickedEvent(
      HomeWishlistNavigateButtonClickedEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('wish list navigate button clicked');
    }
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartNavigateButtonClickedEvent(
      HomeCartNavigateButtonClickedEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('wish list navigate button clicked');
    }
    emit(HomeNavigateToCartPageActionState());
  }
}
