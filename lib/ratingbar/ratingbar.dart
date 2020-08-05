import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;

  RatingBar({this.starCount = 5, this.rating = 0.0, this.color = Colors.black});

  //create star
  Widget buildStar(BuildContext context, int index) {
    IconData iconName = Icons.star;
    Color iconColor = color;

    if (index >= rating) {
      iconName = Icons.star_border;
      iconColor = color.withOpacity(0.6);
    } else if (index > rating - 1 && index < rating) {
      iconName = Icons.star_half;
    }
    return Icon(iconName, size: 16.0, color: iconColor);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(starCount, (i) => buildStar(context, i)),
    );
  }
}
