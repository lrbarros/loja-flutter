import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';

import 'package:flutter/material.dart';
import 'package:loja/datas/product_data.dart';

class ProductScreen extends StatefulWidget {
  final ProductData product;

  const ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;

  int _current = 0;


  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(

            aspectRatio: 1.0,
            child: Carousel(
            boxFit: BoxFit.fill,
              images: product.images.map((url) {
                return Image.network(url.toString());
              }).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: Theme.of(context).primaryColor ,
              autoplay: false,
            ),
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Text(product.title,
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),
                  maxLines: 3,),
                  Text(
                    "R\$ ${product.price.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: primaryColor),
                  )
                ],
              ),
          ),

        ],
      ),
    );
  }
}
