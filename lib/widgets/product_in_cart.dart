import 'package:flutter/material.dart';

class ProductInCart extends StatelessWidget {
  final String name;
  final int price;

  final String description;

  const ProductInCart(
      {required this.name, required this.price, required this.description});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.blueAccent[100],
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          height: MediaQuery.of(context).size.height * .1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name),
                Text(description),
                Text('$price\$'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
