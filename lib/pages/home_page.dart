import 'package:flutter/material.dart';
import 'package:nikestore/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  Widget appBarIcon({@required IconData icon}) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.black,
        size: 28.0,
      ),
      onPressed: () {},
    );
  }

  List<String> items = [
    'Best Seller',
    'Featured',
    'Newest',
    'Man',
    'Woman',
    'Child',
  ];

  Widget _buildItem(String item, bool isSelected) {
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            item,
            style: TextStyle(
              fontSize: isSelected ? 17.0 : 16.0,
              color: isSelected ? Colors.black : Colors.grey[700],
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontFamily: 'VarelaRound',
            ),
          ),
          SizedBox(height: 8.0),
          isSelected
              ? Container(
                  height: 5.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFFFD300),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Nike Store',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'VarelaRound',
          ),
        ),
        leading: appBarIcon(icon: Icons.short_text),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: appBarIcon(icon: Icons.shopping_cart),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.0, top: 16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text.rich(
          TextSpan(
            text: 'New',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: 'VarelaRound',
            ),
            children: <TextSpan>[
              TextSpan(
                text: '\nCollections',
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'VarelaRound',
                ),
              ),
            ],
          ),
        ),
        introCard(),
        Container(
          height: 40.0,
          margin: EdgeInsets.only(top: 20.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: _buildItem(items[index], selectedIndex == index),
              );
            },
          ),
        ),
        ProductCard(),
      ],
    );
  }

  Widget introCard() => Padding(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 16.0, 16.0),
        child: Container(
          height: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.black,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'New Arrivals',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFFFFD300),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'VarelaRound',
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Find shoes for all activities',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'VarelaRound',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                width: 140.0,
                child: Image.asset(
                  'images/cover.png',
                ),
              ),
            ],
          ),
        ),
      );
}
