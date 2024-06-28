import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final int maxRating;
  final Color color;
  final ValueChanged<int> onRatingChanged;

  StarRating({
    required this.rating,
    required this.color,
    required this.maxRating,
    required this.onRatingChanged,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index < rating) {
      icon = Icon(
        Icons.star_rounded,
        size: 50,
        color: color,
      );
    } else {
      icon = Icon(
        Icons.star_border_rounded,
        size: 50,
        color: Colors.grey,
      );
    }
    return GestureDetector(
      onTap: () {
        onRatingChanged(index + 1);
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(maxRating, (index) => buildStar(context, index)),
    );
  }
}
