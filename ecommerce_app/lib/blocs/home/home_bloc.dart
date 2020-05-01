import 'dart:async';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/services/authentication_api.dart';
import 'package:ecommerce_app/services/db_firestore_api.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc {
  final DbApi dbApi;
  final AuthenticationApi authenticationApi;

  final StreamController<List<Product>> _productController =
      BehaviorSubject<List<Product>>();
  Sink<List<Product>> get _addListProduct => _productController.sink;
  Stream<List<Product>> get listProduct => _productController.stream;

  final StreamController<Product> _addProductController =
      BehaviorSubject<Product>();
  Sink<Product> get _addProduct =>  _addProductController.sink;
  Stream<Product> get getProduct =>  _addProductController.stream;

  HomeBloc(this.dbApi, this.authenticationApi) {
    _startListeners();
     _addProductController.stream.listen(addProductToDb);

  }

  Future<String> addProductToDb(Product product) async {
    dbApi.addProduct(product);
  }

  void _startListeners() {
    authenticationApi.getFirebaseAuth().currentUser().then((user) {
      dbApi.getProductList().listen((productDocs) {
        _addListProduct.add(productDocs);
        print(productDocs);
      });

    });
  }

  void dispose() {
    _productController.close();
    _addProductController.close();
  }
}
