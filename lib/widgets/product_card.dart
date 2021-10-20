import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final Function onPressed;
  final String description;

  const ProductCard(
      {required this.name,
      required this.price,
      required this.onPressed,
      required this.description});
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
                IconButton(
                    onPressed: () async {
                      await onPressed();
                    },
                    icon: const Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Colors.blueGrey,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
