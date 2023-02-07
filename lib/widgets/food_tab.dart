import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class FoodTab extends StatefulWidget {
  const FoodTab({Key? key}) : super(key: key);

  @override
  State<FoodTab> createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildListItem('Delicious hot dog', 4.0, '6', 'assets/hotdog.png'),
          _buildListItem('Cheese Pizza', 5.0, '12', 'assets/pizza.png'),
          _buildListItem('Delicious hot dog', 4.0, '6', 'assets/hotdog.png'),
          _buildListItem('Cheese Pizza', 5.0, '12', 'assets/pizza.png'),
        ],
      ),
    );
  }

  _buildListItem(
      String foodName, double rating, String price, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 210,
            child: Row(
              children: [
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    color: const Color(0xffffe3df),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      width: 50.0,
                      height: 50.0,
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
                    SmoothStarRating(
                      allowHalfRating: false,
                      rating: rating,
                      onRatingChanged: (v) {},
                      starCount: rating.toInt(),
                      color: const Color(0xffffd143),
                      borderColor: const Color(0xffffd143),
                      size: 15.0,
                      spacing: 0.0,
                    ),
                    Row(
                      children: [
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
                        const SizedBox(width: 3.0),
                        Text(
                          '\$18',
                          style: GoogleFonts.lato(
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w600,
                            textStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          FloatingActionButton(
            onPressed: () {},
            heroTag: foodName,
            mini: true,
            child: const Center(
              child: Icon(Icons.add, color: Colors.white,),
            ),
            backgroundColor: Color(0xffff7d6a),
          ),
        ],
      ),
    );
  }
}
