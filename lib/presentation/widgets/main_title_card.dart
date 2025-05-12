import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constspacings.dart';
import 'package:netflix_clone/presentation/Controller/model_class.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({required this.title,required this.movies,
    super.key,
  });
  final String title;
  final List<Movie> movies;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kheight10,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(movies.length, (index) => MainCard(image: movies[index].posterPath,)),
          ),
        ),
      ],
    );
  }
}
