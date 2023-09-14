import 'package:ecommerce_flutter_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_flutter_bloc/features/home/bloc/home_bloc.dart';
import 'package:ecommerce_flutter_bloc/features/home/model/product_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  const CartTileWidget({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(productDataModel.images);
    }
    return Card(
      color: Colors.white70,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        margin: const EdgeInsets.only(
          left: 5,
          right: 5,
          top: 0,
          bottom: 10,
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      // cartBloc.add(HomeProductsWishlistButtonClickedEvent(
                      //     clickedProduct: productDataModel));
                    },
                    icon: const Icon(Icons.favorite_border),
                    padding: const EdgeInsets.all(0),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(CartRemovalEvent(productDataModel));
                    },
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(Icons.shopping_bag),
                  ),
                ],
              ),
              Image.network(
                productDataModel.images,
                height: 250,
                width: double.maxFinite,
                fit: BoxFit.fitWidth,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productDataModel.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(productDataModel.description),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      '\$ ${productDataModel.price}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
