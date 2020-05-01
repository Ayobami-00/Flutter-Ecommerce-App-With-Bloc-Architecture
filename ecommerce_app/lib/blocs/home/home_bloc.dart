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

  HomeBloc(this.dbApi, this.authenticationApi) {
    _startListeners();
  }

  void _startListeners() {
    // Retrieve Firestore Journal Records as List<Journal> not DocumentSnapshot
    authenticationApi.getFirebaseAuth().currentUser().then((user) {
      dbApi.getProductList().listen((productDocs) {
        _addListProduct.add(productDocs);
        print(productDocs);
      });

    });
  }

  void dispose() {
    _productController.close();
  }
}
