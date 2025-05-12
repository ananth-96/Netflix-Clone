import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constspacings.dart';
import 'package:netflix_clone/presentation/Controller/controller_movie.dart';
import 'package:netflix_clone/presentation/Controller/model_class.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_Watching_Widget.dart';
import 'package:netflix_clone/presentation/widgets/app_bar-widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
List <Movie> comingSoon=[];
List<Movie> everyonesWatching=[];

Future getNewAndHot() async{

  comingSoon=await MovieService.getTopRatedMovies();
  everyonesWatching=await MovieService.getUpcomingMovies();

  setState(() {
    
  });
}

@override
  void initState() {
    getNewAndHot();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            actions: [
              Icon(Icons.cast_rounded, color: Colors.white, size: 30),
              kwidth10,
              Container(color: Colors.blue, height: 30, width: 30),
              kwidth10,
            ],
            bottom: TabBar(
              isScrollable: false,
              indicatorWeight: 0,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              indicator: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              labelPadding: EdgeInsets.only(right: 16, left: 1),
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.white,

              tabs: [
                Tab(text: ' 🍿 Coming Soon '),
                Tab(text: " 👀 Everyone's watching "),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(context),
            _buildEveryoneWatching("Everyone's watching"),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    return ListView.builder(
      itemCount: comingSoon.length,
      itemBuilder: (BuildContext, index) => ComingSoonWidget(title:comingSoon[index].title?? 'No title',image: comingSoon[index].posterPath?? defaultImage, description: comingSoon[index].overview??'No description available',),
    );
  }

  Widget _buildEveryoneWatching(String name) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) => EveryonesWatchingWidget(image: everyonesWatching[index].posterPath??defaultImage,title:everyonesWatching[index].originalTitle, description: everyonesWatching[index].overview??'No description available',),
      itemCount: everyonesWatching.length,
    );
  }
}
