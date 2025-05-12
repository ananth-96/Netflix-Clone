import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:video_player/video_player.dart';

const imageUrl =
    'https://sweetanimatedfilms.wordpress.com/wp-content/uploads/2018/01/hodja-and-the-magic-carpet-3-horizontal-image.jpg';

class VideoListItem extends StatefulWidget {
  final int index;
  final String videoUrl;
  const VideoListItem({required this.index, required this.videoUrl,  super.key});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
late VideoPlayerController _videoPlayerController;
bool isVolume=true;
bool isPlay=true;

@override
  void initState() {
    videoContoller(videoPath:videoPathList[widget.index]);
    super.initState();
  }

void videoContoller({ required String videoPath}){
  _videoPlayerController= VideoPlayerController.network(videoPath);
  _videoPlayerController.initialize().then((value){
    setState(() {
      _videoPlayerController.play();
    });
  });
}

@override
void dispose(){
  _videoPlayerController.dispose();
  super.dispose();
}




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       SizedBox(height: double.infinity,width: double.infinity,child:_videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController))
                  : const CupertinoActivityIndicator(radius: 18,color: Colors.white,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {
                           setState(() {
                              isVolume=!isVolume;
                            });
                            if(_videoPlayerController.value.volume==0.0){
                              _videoPlayerController.setVolume(1.0);
                            }else{
                              _videoPlayerController.setVolume(0.0);
                            }

                    },
                    icon: isVolume?  Icon(Icons.volume_up,color: Colors.white,):const Icon(Icons.volume_off))
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



List<String> videoPathList = [
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
];