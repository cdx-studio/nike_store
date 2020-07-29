import 'package:flutter/material.dart';

class ProductDetialsPage extends StatefulWidget {
  ProductDetialsPage({
    @required this.rating,
    @required this.productName,
    @required this.productPrice,
    @required this.productImage,
  });
  final String rating;
  final String productName;
  final String productPrice;
  final String productImage;

  @override
  _ProductDetialsPageState createState() => _ProductDetialsPageState();
}

class _ProductDetialsPageState extends State<ProductDetialsPage> {
  int selectedIndex = 4;

  String description =
      'The Nike Zoom Pegasus Turbo delivers your favourite lightweight running shoe'
      ' in a smart, weatherised design, so you can continue training in confidence despite those dark and rainy months.';

  Widget appBarButtons(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  List<String> sizes = [
    '39',
    '40',
    '41',
    '42',
    '42.5',
    '43',
  ];

  Widget _buildSizeBoxes(String size, bool isSelected) {
    return Container(
      height: isSelected ? 50.0 : 45.0,
      width: isSelected ? 50.0 : 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: isSelected ? Colors.black : Colors.grey[300],
      ),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Color(0xFFFFD300) : Colors.black,
            fontFamily: 'VarelaRound',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 0.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Image.asset(
                      widget.productImage,
                      width: 300.0,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top,
                    right: 16.0,
                    left: 16.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        appBarButtons(context),
                        SizedBox(height: 40.0),
                        productDetails(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Size',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'VarelaRound',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: sizes.map((size) {
                      var sizeIndex = sizes.indexOf(size);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = sizeIndex;
                          });
                        },
                        child:
                            _buildSizeBoxes(size, selectedIndex == sizeIndex),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 25.0),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'VarelaRound',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600,
                      fontFamily: 'VarelaRound',
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[700],
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 25.0),
                      Expanded(
                        child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFFFFD300),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'VarelaRound',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget productDetails() {
    return Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.rating,
            style: TextStyle(
              fontSize: 22.0,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            widget.productName,
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: 'VarelaRound',
              letterSpacing: 0.6,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            widget.productPrice,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'VarelaRound',
            ),
          )
        ],
      ),
    );
  }
}
