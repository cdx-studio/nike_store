import 'package:flutter/material.dart';
import 'package:nikestore/pages/product_details.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SingleProduct(
          rating: '★★★★☆',
          productName: 'Nike Zoom\nPegasus Turbo',
          productPrice: '\$130',
          productImage: 'images/product-1.png',
          sale: true,
          rightAlign: true,
        ),
        SingleProduct(
          rating: '★★★★★',
          productName: 'Nike Air\nZoom Pegasus35',
          productPrice: '\$140',
          productImage: 'images/product-2.png',
          sale: false,
          rightAlign: false,
        ),
      ],
    );
  }
}

class SingleProduct extends StatelessWidget {
  SingleProduct({
    @required this.rating,
    @required this.productName,
    @required this.productPrice,
    @required this.productImage,
    @required this.sale,
    @required this.rightAlign,
  });
  final String rating;
  final String productName;
  final String productPrice;
  final String productImage;
  final bool sale;
  final bool rightAlign;
  Widget textChild() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment:
              rightAlign ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              rating,
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              productName,
              textAlign: rightAlign ? TextAlign.right : TextAlign.left,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'VarelaRound',
                letterSpacing: 0.6,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              productPrice,
              textAlign: rightAlign ? TextAlign.right : TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'VarelaRound',
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget productChild() {
    return Expanded(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              margin: rightAlign
                  ? EdgeInsets.only(left: 60.0)
                  : EdgeInsets.only(right: 60.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: EdgeInsets.all(10.0),
              alignment: rightAlign ? Alignment.topRight : Alignment.topLeft,
              child: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
            rightAlign
                ? Positioned(
                    bottom: 15.0,
                    left: 0.0,
                    child: Image.asset(
                      productImage,
                      width: 150.0,
                    ),
                  )
                : Positioned(
                    bottom: 15.0,
                    right: 0.0,
                    child: Image.asset(
                      productImage,
                      width: 150.0,
                    ),
                  ),
            sale
                ? rightAlign
                    ? Positioned(
                        top: 10.0,
                        left: 25.0,
                        child: Container(
                          height: 30.0,
                          width: 60.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Text(
                            'SALE',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'VarelaRound',
                            ),
                          ),
                        ),
                      )
                    : Positioned(
                        top: 10.0,
                        right: 25.0,
                        child: Container(
                          height: 30.0,
                          width: 60.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Text(
                            'SALE',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'VarelaRound',
                            ),
                          ),
                        ),
                      )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetialsPage(
                  rating: rating,
                  productName: productName,
                  productPrice: productPrice,
                  productImage: productImage,
                )));
      },
      child: Container(
        height: 170.0,
        margin: EdgeInsets.only(right: 16.0, top: 16.0),
        child: Row(
          children: <Widget>[
            rightAlign ? textChild() : productChild(),
            SizedBox(width: 8.0),
            rightAlign ? productChild() : textChild(),
          ],
        ),
      ),
    );
  }
}
