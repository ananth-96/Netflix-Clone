import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constspacings.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
   EveryonesWatchingWidget({
    super.key,required this.image,required this.description,required this.title
  });
String image;
String description;
String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        kheight05, Text(
                      title,
      
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                       
                      ),
                    ),
                    kheight10,
      
                      Text(
                  description,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                kheight40,
      
                VideoWidget(image: image,),
                kheight15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [CustomButtonWidget(
                      icon: Icons.send_rounded,
                      iconLabel: 'Share',
                      textSize: 14,
                      iconSize: 35,
                    ),
                    kwidth15,
                    CustomButtonWidget(
                      icon: Icons.add,
                      iconLabel: 'My List',
                      textSize: 14,
                      iconSize: 35,
                    ),
                    kwidth15,CustomButtonWidget(
                      icon: Icons.play_arrow,
                      iconLabel: 'Play',
                      textSize: 14,
                      iconSize: 35,
                    ),kwidth15],),kheight15
      ],),
    );
  }
}
