import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class searchTextTitle extends StatelessWidget {
  String  title;
   searchTextTitle({required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        color: kWhiteColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}