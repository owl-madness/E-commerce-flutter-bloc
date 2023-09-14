part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomePageInitialFetchEvent extends HomeEvent {}

class HomeProductsWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductsWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProductsCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductsCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishlistNavigateButtonClickedEvent extends HomeEvent {}

class HomeCartNavigateButtonClickedEvent extends HomeEvent {}
