import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String description;
  final int price;

  Product({
    required this.description,
    required this.name,
    required this.price,
  });

  factory Product.fromDocument(QueryDocumentSnapshot data) {
    return Product(
      description: data.get('description'),
      name: data.get('name'),
      price: data.get('price'),
    );
  }
  factory Product.fromJson(Map<dynamic, dynamic> json) {
    return Product(
        name: json['name'],
        description: json['description'],
        price: json['price']);
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
