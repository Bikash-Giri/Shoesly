import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShoeslyRatingBar extends StatelessWidget {
  final double rating;

  const ShoeslyRatingBar({super.key, required this.rating});
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 13,
      direction: Axis.horizontal,
    );
  }
}
