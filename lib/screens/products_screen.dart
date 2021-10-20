import 'package:flutter/material.dart';
import 'package:limitless/Database/database.dart';
import 'package:limitless/Models/product.dart';
import 'package:limitless/screens/shopping_cart.dart';
import 'package:limitless/widgets/product_card.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<List<Product>> products;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ShoppingCart(),
              ));
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: ProductServices().getProducts(),
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
                  return ProductCard(
                    description: snapshot.data![index].description,
                    name: snapshot.data![index].name,
                    onPressed: () async {
                      await ProductServices().addToCart(
                          snapshot.data![index].name,
                          snapshot.data![index].price,
                          snapshot.data![index].description);
                    },
                    price: snapshot.data![index].price,
                  );
                },
              );

            default:
              return const Text('Default');
          }
        },
      ),
    );
  }
}
