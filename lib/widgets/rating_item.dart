import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  // const RatingItem({Key? key}) : super(key: key);

  final int index;
  final int rating;

  RatingItem({required this.index, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating
          ? 'assets/images/icon_star.png'
          : 'assets/images/icon_star_grey.png',
      width: 20,
    );
  }
}
