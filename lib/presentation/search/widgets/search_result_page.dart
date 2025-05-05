import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constspacings.dart';
import 'package:netflix_clone/presentation/search/title.dart';

const imageUrl =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxWmDaHTNKfA7cue084WPkgkZJGWIuzllNzw&s";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        searchTextTitle(title: 'Movies & TV'),
        kheight15,
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: GridView.count(
              mainAxisSpacing: 8,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              childAspectRatio: 1.1/1.55,
              children: List.generate(20, (index) {
                return const MainCardSearch();
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class MainCardSearch extends StatelessWidget {
  const MainCardSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7)
      ),
    );
  }
}
