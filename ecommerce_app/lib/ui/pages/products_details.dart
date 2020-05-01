import 'package:ecommerce_app/ui/widgets/carousel_products.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String name;
  final double price;
  final String picture1;
  final String picture2;
  final String color;
  final String size;

  const ProductDetails({Key key,this.name,this.price,this.picture1,this.picture2,this.color,this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              CarouselProducts(
                image1: picture1,
                image2: picture2,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Spacer(),
                    Text(
                      "$name",
                      style: Theme.of(context).textTheme.display1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(height: 10.0,),
                    Text("\$ $price"),
                    Spacer(),
                    Text(
                      "Color: $color",
                      style: Theme.of(context).textTheme.headline.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    
                    Spacer(),
                    Text(
                      "Size: $size",
                      style: Theme.of(context).textTheme.headline.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: double.infinity,
                        child: RaisedButton(
                          child: Text(
                            "ADD TO CART",
                            style: Theme.of(context).textTheme.button.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          onPressed: () {},
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}