import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constspacings.dart';
import 'package:netflix_clone/presentation/widgets/app_bar-widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

final _widgetsList=[Section1(), Section2(), Section3()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(title: 'Downloads'),
        ),
        body: ListView.separated(itemBuilder: (context,index)=>_widgetsList[index],
         separatorBuilder: (context,index)=>SizedBox(height:5), 
         itemCount: _widgetsList.length,
         padding: EdgeInsets.all(10),),
      ),
    );
  }
}

class Section1 extends StatelessWidget {
  const Section1({super.key});

  @override
  Widget build(BuildContext context) {
    return _SmartDownloads();
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final imageList = [
    "https://media.themoviedb.org/t/p/w600_and_h900_bestv2/vNVFt6dtcqnI7hqa6LFBUibuFiw.jpg",
    "https://media.themoviedb.org/t/p/w600_and_h900_bestv2/r46leE6PSzLR3pnVzaxx5Q30yUF.jpg",
    "https://media.themoviedb.org/t/p/w600_and_h900_bestv2/aLVkiINlIeCkcZIzb7XHzPYgO6L.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        kheight20,
        const Text(
          'Introducing Downloads For You',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        kheight10,
        Text(
          "We'll download a persinalised selection of \n movies and shows for you, so there's \n always something to watch on your \n device.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        
        Container(
          width: size.width,
          height: size.width,
          color: Colors.black,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.37,
                  backgroundColor: Colors.grey.shade900,
                ),

                DownloadsImageWidget(
                  size: size,
                  height: size.height * 0.34,
                  width: size.width * 0.34,
                  imageList: imageList[1],
                  margin: EdgeInsets.only(right: 150, bottom: 40.5),
                  angle: -20,
                ),
                DownloadsImageWidget(
                  size: size,
                  height: size.height * 0.34,
                  width: size.width * 0.34,
                  imageList: imageList[2],
                  margin: EdgeInsets.only(left: 150, bottom: 40),
                  angle: 20,
                ),
                DownloadsImageWidget(
                  size: size,
                  height: size.height * 0.37,
                  width: size.width * 0.37,
                  imageList: imageList[0],
                  margin: EdgeInsets.all(0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15 ),
          child: ConstrainedBox(

            constraints: BoxConstraints(minWidth: double.infinity),
            child: MaterialButton(
              
              onPressed: () {},
              color: kButtonColordeepBlue,
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                'Setup',
                style: TextStyle(
                  color: kButtonColorWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only( top: 5),
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            onPressed: () {},
            color: kButtonColorWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              'See what you can download',
              style: TextStyle(
                color: kBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Row(
        children: const [
          kwidth10,
          Icon(Icons.settings, color: kWhiteColor),kwidth10,
          Text('Smart Downloads', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.size,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.height,
    required this.width,
  });

  final Size size;
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          margin: margin,
          height: height,
          width: width,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage(imageList)),
          ),
        ),
      ),
    );
  }
}
