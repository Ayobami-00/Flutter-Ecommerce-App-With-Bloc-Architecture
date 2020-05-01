class Product {
  String documentID;
  String name;
  String picture;
  double price;

  Product({this.documentID, this.name, this.picture, this.price});

  factory Product.fromDoc(dynamic doc) => Product(
        documentID: doc.documentID,
        name: doc["name"],
        picture: doc["picture"],
        price: doc["price"],
      );
}
