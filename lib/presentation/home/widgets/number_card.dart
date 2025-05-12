import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/Controller/model_class.dart';
import 'package:stroke_text/stroke_text.dart';

class NumberCard extends StatelessWidget {
  NumberCard({super.key, required this.index, required this.image});
  int index;
  String? image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(width: 40),
            SizedBox(
              width: 134,
              height: 200,
              child: Image.network(
                imageBase + image!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator(color: Colors.white,));
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, color: Colors.red);
                },
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
