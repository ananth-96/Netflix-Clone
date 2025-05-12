import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constspacings.dart';
import 'package:netflix_clone/presentation/Controller/controller_movie.dart';
import 'package:netflix_clone/presentation/Controller/model_class.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result_page.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

final ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}



class _ScreenHomeState extends State<ScreenHome> {

List<Movie> nowPlaying=[];
List<Movie> popular=[];
List<Movie> topShows=[];
List<Movie> southIndian=[];
List<Movie> allmovies=[];



Future getallMovie()async{
  nowPlaying =await MovieService.getNowPlayingMovies();
  popular=await MovieService.getPopularMovies();    
  topShows= await MovieService.getTopRatedMovies();
  allmovies=await MovieService.getUpcomingMovies();
  setState(() {
    
  });
}

@override
void initState(){
  getallMovie();
  super.initState();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 8,right: 8),
          child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  print(direction);
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    {
                      scrollNotifier.value = true;
                    }
                  }
                  return true;
                },
                 child: Stack(
                  children: [
                    RefreshIndicator(onRefresh: getallMovie,
                      child: ListView(
                        children:  [
                          BackgroundCard(),
                      
                          MainTitleCard(
                            movies:allmovies ,
                            title: 'Released in the Past Year'),
                          kheight10,
                          MainTitleCard(
                            movies: topShows,
                            title: 'Trending Now'),
                          kheight10,
                          NumberTitleCard(movies:allmovies,),
                          kheight10,
                          MainTitleCard(
                            movies:popular ,
                            title: 'Tense Dramas'),
                          kheight10,
                          MainTitleCard(
                            movies:topShows ,
                            title: 'South Indian Cinemas'),
                          kheight10,
                        ],
                      ),
                    ),

                     ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, isVisible, _) {
              return isVisible?TopBarWidget():const SizedBox(height: 5,);
                },)
                    
                  ],
                ),
        ))));
  }
}

          
         class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 90,
      width: double.infinity,
      color: Colors.black.withOpacity(0.3),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsZLFW9PjmQSTrcc-BfDZL_8ENLgsuz3Ov0g&s',
                height: 50,
                width: 60,
              ),
              const Spacer(),
              const Icon(
                Icons.cast_rounded,
                color: Colors.white,
                size: 30,
              ),
              kwidth10,
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                ),
                height: 30,
                width: 30,
              ),
              kwidth10,
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('TV Shows', style: kHomestyle),
                Text('Movies', style: kHomestyle),
                Text('Categories', style: kHomestyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
               

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({super.key,required this.movies});
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: 'Top 10 TV Shows In India Today'),
        kheight10,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(movies.length, (index) => NumberCard(index: index,image: movies[index].posterPath,)),
          ),
        ),
      ],
    );
  }
}
