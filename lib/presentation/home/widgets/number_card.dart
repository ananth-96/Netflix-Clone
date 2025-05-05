import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:stroke_text/stroke_text.dart';

class NumberCard extends StatelessWidget {
  NumberCard({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(width: 40),
            Container(
              width: 134,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://www.movieposters.com/cdn/shop/files/spirtedaway.jap.24x36.jpg?v=1709822795',
                  ),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),

        Positioned(
          left: 8,
          top: 68,
          child: StrokeText(
            text: '${index + 1}',
            textStyle: TextStyle(color: Colors.black, fontSize: 120),
            strokeColor: Colors.white,
            strokeWidth: 6,
          ),
        ),
      ],
    );
  }
}
