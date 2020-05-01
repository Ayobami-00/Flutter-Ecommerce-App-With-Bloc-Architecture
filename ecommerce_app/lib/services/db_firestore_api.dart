import 'package:ecommerce_app/models/product.dart';

abstract class DbApi {
  Stream<List<Product>> getProductList();
  Future<List<Product>> getCartList(String uid);
  Future<bool> addProduct(Product product);
  Future<void> addProductToCart(String uid, Product product);
}
