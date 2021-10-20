import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:limitless/Models/produc_in_cart.dart';
import 'package:limitless/Models/product.dart';

class ProductServices {
  final CollectionReference productsCollectionReference =
      FirebaseFirestore.instance.collection('products');
  final CollectionReference productsInCartCollectionReference =
      FirebaseFirestore.instance.collection('productsInCart');

  Future<List<Product>> getProducts() async {
    final productData = await productsCollectionReference.get();
    final productList = productData.docs.map((doc) {
      return Product.fromDocument(doc);
    }).toList();
    return productList;
  }

  Future<void> addToCart(String name, int price, String description) async {
    final newProduct = productsInCartCollectionReference.doc();
    final ProductInCart productInCart = ProductInCart(
        description: description,
        name: name,
        price: price,
        userId: 'lqPLcQmpQDRZeyTo4j84ays9Q7a2');
    await newProduct.set(productInCart.toMap());
  }

  Future<List<ProductInCart>> getProductsInCartByUserId() async {
    final productData = await productsInCartCollectionReference.get();
    final productList = productData.docs.map((doc) {
      return ProductInCart.fromDocument(doc);
    }).toList();

    return productList;
  }
}
