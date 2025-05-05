import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

const imageUrl =
    'https://sweetanimatedfilms.wordpress.com/wp-content/uploads/2018/01/hodja-and-the-magic-carpet-3-horizontal-image.jpg';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.accents[index % Colors.accents.length]),
        Align(
          alignment: Alignment.bottomCenter
        ,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.volume_off,color: kWhiteColor,),iconSize: 30,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(imageUrl),),

                    VideoActionsWidget(
                      title: 'LOL',
                      icon: Icons.emoji_emotions,
                    ),
                    VideoActionsWidget(title: 'My List', icon: Icons.add),
                    VideoActionsWidget(title: 'Share', icon: Icons.share_sharp),
                    VideoActionsWidget(
                      title: 'Play',
                      icon: Icons.play_arrow,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const VideoActionsWidget({
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 30),
          Text(title, style: TextStyle(fontSize: 16, color: kWhiteColor)),
        ],
      ),
    );
  }
}
