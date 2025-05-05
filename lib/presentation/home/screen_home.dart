import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constspacings.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result_page.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

final ValueNotifier<bool> scrollNotifier = ValueNotifier(false);
class ScreenHome extends StatelessWidget {
   ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context,index,_){
              return NotificationListener<UserScrollNotification>(
              onNotification: (notification){
                final ScrollDirection direction=notification.direction;
                print(direction);
                if(direction==ScrollDirection.reverse){
                  scrollNotifier.value=false;
                } else if 
                  (direction==ScrollDirection.forward){
                {scrollNotifier.value=true;}}
                return true;},
              child: Stack(
                children: [
                  
                  ListView(
                    children: const [
                     BackgroundCard(),
                  
                      MainTitleCard(title: 'Released in the Past Year'),
                      kheight10,
                      MainTitleCard(title: 'Trending Now'),
                      kheight10,
                      NumberTitleCard(),
                      kheight10,
                      MainTitleCard(title: 'Tense Dramas'),
                      kheight10,
                      MainTitleCard(title: 'South Indian Cinemas'),
                      kheight10,
                    ],
                  ),
                 scrollNotifier.value?
                  Container(width: double.infinity,height: 80,color: Colors.red,): kheight05,
                 
                ],
              ),
              
            );
            },
             
          ),
        ),
      ),
    );
  }

}

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({super.key});

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
            children: List.generate(10, (index) => NumberCard(index: index)),
          ),
        ),
      ],
    );
  }
}
