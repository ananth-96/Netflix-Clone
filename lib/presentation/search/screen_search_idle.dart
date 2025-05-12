import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constspacings.dart';
import 'package:netflix_clone/presentation/Controller/model_class.dart';
import 'package:netflix_clone/presentation/search/title.dart';

const imageUrl =
    'https://sweetanimatedfilms.wordpress.com/wp-content/uploads/2018/01/hodja-and-the-magic-carpet-3-horizontal-image.jpg';

class ScreenSearchIdle extends StatelessWidget {
  final List<Movie> popularMovies;
  const ScreenSearchIdle({super.key, required this.popularMovies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchTextTitle(title: 'Top Searches',),
              kheight10,
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                    itemBuilder: (context, index)  {
                      print(popularMovies[index].posterPath);
                      return TopSearchItemTile(imageUrl:popularMovies[index].posterPath??defaultImage, title: popularMovies[index].title??'NO Title Available',);
                    },
                    separatorBuilder: (context, index) => kheight20,
                    itemCount: popularMovies.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TopSearchItemTile extends StatelessWidget {
  String title;
  final String imageUrl;
   TopSearchItemTile({super.key,required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 85,
          width: screenWidth * 0.35,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageBase+imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10),
         Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        const Icon(Icons.play_circle_outline, color: Colors.white, size: 39),
      ],
    );
  }
}
