import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constspacings.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
   ComingSoonWidget({super.key,required this.title,required this.image,required this.description});
String title;
String image;
String description;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: const [
              Text(
                'FEB',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                '11',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 480,
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(image: image,),
              kheight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                  
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -2,
                    ),
                  ),
                  kwidth10,
                  CustomButtonWidget(
                    icon: Icons.notifications,
                    iconLabel: 'Remind Me',
                    textSize: 14,
                    iconSize: 25,
                  ),

                  CustomButtonWidget(
                    icon: Icons.info,
                    iconLabel: 'Info',
                    textSize: 14,
                    iconSize: 25,
                  ),
                  kwidth05,
                ],
              ),
              kheight05,
              Text(
                'Coming on Friday',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              kheight05,
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Text(
                description,
                maxLines: 3,
                
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
