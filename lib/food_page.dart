import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodPage extends StatefulWidget {
  final String imgPath, foodName, pricePerItem, heroTag;

  const FoodPage(
      {super.key,
      required this.foodName,
      required this.heroTag,
      required this.imgPath,
      required this.pricePerItem});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // menu and cart
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 45.0,
                      width: 45.0,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xfffe7d6a).withOpacity(0.3),
                            spreadRadius: 4.0,
                            blurRadius: 6.0,
                            offset: const Offset(0.0, 4.0),
                          ),
                        ],
                        color: const Color(0xfffe7d6a),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 1.0,
                      right: 4.0,
                      child: Container(
                        height: 12.0,
                        width: 12.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: GoogleFonts.notoSans(
                              fontSize: 7.0,
                              textStyle: const TextStyle(color: Colors.red),
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
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              widget.foodName.toString().toUpperCase(),
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800,
                fontSize: 27.0,
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          // menu and cart

          // image with2 vertical buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.imgPath), fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 45.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 6.0,
                              offset: const Offset(5.0, 11.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: Color(0xFFFE7D6A),
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35.0),
                  Stack(
                    children: [
                      Container(
                        width: 45.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 6.0,
                              offset: const Offset(5.0, 11.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.restore,
                            color: Color(0xFFFE7D6A),
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // image with2 vertical buttons

          const SizedBox(
            height: 10.0,
          ),

          // price and add to cart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  width: 125.0,
                  height: 70.0,
                  color: Colors.white,
                  child: Text(
                    '\$${int.parse(widget.pricePerItem) * quantity}',
                    style: GoogleFonts.notoSans(
                      fontSize: 40.0,
                      color: const Color(0xFF5E6166),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                width: 225.0,
                decoration: const BoxDecoration(
                  color: Color(0xFFFE7D6A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40.0,
                      // width: 105.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              adjustQuantity('MINUS');
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Color(0xFFFE7D6A),
                            ),
                          ),
                          Text(
                            quantity.toString(),
                            style: GoogleFonts.notoSans(
                                fontSize: 14.0,
                                color: const Color(0xFFFE7D6A),
                                fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                            onPressed: () {
                              adjustQuantity('PLUS');
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Color(0xFFFE7D6A),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Add To Cart',
                      style: GoogleFonts.notoSans(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // price and add to cart
          const SizedBox(
            height: 30.0,
          ),

          // featured
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'FEATURED',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            height: 225.0,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem(),
                _buildListItem(),
              ],
            ),
          ),
          // featured
        ],
      ),
    );
  }

  _buildListItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        children: [
          _buildColumnItem(
            'assets/popcorn.png',
            'Sweet Popcorn',
            6.0,
            const Color(0xFFFBD6F5),
          ),
          const SizedBox(height: 15.0),
          _buildColumnItem(
            'assets/cheese.png',
            'Sweet cheese',
            6.0,
            const Color(0xFFFBD6F5),
          ),
        ],
      ),
    );
  }

  _buildColumnItem(
      String imgPath, String foodName, double price, Color bgColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 75.0,
          width: 75.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            color: bgColor,
          ),
          child: Center(
            child: Image.asset(
              imgPath,
              height: 50.0,
              width: 50.0,
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              foodName,
              style: GoogleFonts.notoSans(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '\$$price',
              style: GoogleFonts.lato(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                textStyle: const TextStyle(
                  color: Color(0xFFF68D7F),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  adjustQuantity(pressCase) {
    switch (pressCase) {
      case 'MINUS':
        if (quantity <= 1) return;
        setState(() {
          quantity -= 1;
        });
        return;
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
    }
  }
}
