import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/services/db_firestore_api.dart';

class DbFirestoreService implements DbApi {
  Firestore _firestore = Firestore.instance;
  String _collectionProducts = 'products';

  Stream<List<Product>> getProductList() {
    return _firestore
        .collection(_collectionProducts)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      List<Product> _productDocs =
          snapshot.documents.map((doc) => Product.fromDoc(doc)).toList();
      return _productDocs;
    });
  }

  Future<bool> addProduct(Product product) async {
    DocumentReference _documentReference =
        await _firestore.collection(_collectionProducts).add({
      'name': product.name,
      'picture1': product.picture1,
      'picture2': product.picture2,
      'price': product.price,
      'color': product.color,
      'size': product.size,
    });
    return _documentReference.documentID != null;
  }

  Future<void> addProductToCart(String uid, Product product) async {
    DocumentSnapshot doc =
        await _firestore.collection("users").document(uid).get();
    List<Map<String, dynamic>> cart = doc.data["cart"] != null
        ? doc.data["cart"].castList<Map<String, dynamic>>()
        : null;
    if (cart != null) {
      cart.add({
        'documentID': product.documentID,
        'name': product.name,
        'picture1': product.picture1,
        'picture2': product.picture2,
        'price': product.price,
        'color': product.color,
        'size': product.size,
      });
    } else {
      cart = List<Map<String, dynamic>>();
      cart.add({
        'documentID': product.documentID,
        'name': product.name,
        'picture1': product.picture1,
        'picture2': product.picture2,
        'price': product.price,
        'color': product.color,
        'size': product.size,
      });
    }
  }

  Future<List<Product>> getCartList(String uid) async {
    DocumentSnapshot doc =
        await _firestore.collection("users").document(uid).get();
    List<Map<String, dynamic>> cart = doc.data["cart"] != null
        ? doc.data["cart"].castList<Map<String, dynamic>>()
        : null;
    List<Product> data;
    cart.forEach((f) {
      data.add(Product.fromDoc(f));
    });
    return data;
  }
}
