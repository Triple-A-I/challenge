import 'package:cloud_firestore/cloud_firestore.dart';

class ProductInCart {
  final String userId;
  // final Product productInCart;
  final String name;
  final int price;
  final String description;

  ProductInCart({
    required this.description,
    required this.price,
    required this.name,
    // required this.productInCart,
    required this.userId,
  });

  factory ProductInCart.fromDocument(QueryDocumentSnapshot data) {
    return ProductInCart(
      name: data.get('name'),
      description: data.get('description'),
      price: data.get('price'),
      userId: data.get('userId'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'description': description,
      'name': name,
      'price': price,
    };
  }
}
