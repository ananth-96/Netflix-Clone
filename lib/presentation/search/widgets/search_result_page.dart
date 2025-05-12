import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constspacings.dart';
import 'package:netflix_clone/presentation/Controller/model_class.dart';
import 'package:netflix_clone/presentation/search/title.dart';



class SearchResultWidget extends StatelessWidget {
  final List<Movie> result;
  const SearchResultWidget({super.key, required this.result});

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
              children: List.generate(result.length, (index) {
                return  MainCardSearch(url: result[index].posterPath?? defaultImage,);
                
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class MainCardSearch extends StatelessWidget {
  String url;
     MainCardSearch({super.key,required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageBase+url),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7)
      ),
    );
  }
}
