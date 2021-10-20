import 'package:flutter/material.dart';
import 'package:limitless/Database/database.dart';
import 'package:limitless/Models/produc_in_cart.dart';
import 'package:limitless/screens/product_card_in_cart.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<ProductInCart>>(
          future: ProductServices().getProductsInCartByUserId(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('None');
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const Text('Active or maybe Waiting');
              case ConnectionState.done:
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ProductCardInCart(
                      description: snapshot.data![index].description,
                      name: snapshot.data![index].name,
                      price: snapshot.data![index].price,
                    );
                  },
                );

              default:
                return const Text('Default');
            }
          }),
    );
  }
}
