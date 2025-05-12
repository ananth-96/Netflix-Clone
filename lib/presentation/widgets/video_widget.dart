import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/Controller/model_class.dart';  






class VideoWidget extends StatelessWidget {
   VideoWidget({
    super.key,required this.image
  });
String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 250,
          width: 400,
          child: Image.network(
           imageBase+image,
           loadingBuilder: (context, child, loadingProgress) {
             if(loadingProgress==null) return child;
             return Center(child: CircularProgressIndicator(color: Colors.white,));
           },
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.volume_off, color: kWhiteColor),
              iconSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
