class Product {
  String documentID;
  String name;
  String picture1;
  String picture2;
  double price;
  String color;
  String size;

  Product({this.documentID, this.name, this.picture1, this.picture2, this.price, this.color,this.size});

  factory Product.fromDoc(dynamic doc) => Product(
        documentID: doc.documentID,
        name: doc["name"],
        picture1: doc["picture1"],
        picture2: doc["picture2"],
        price: doc["price"],
        color: doc["color"],
        size : doc["size"],
      );
}
