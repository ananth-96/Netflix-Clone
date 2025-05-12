import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 600,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://www.tallengestore.com/cdn/shop/files/HowlsMovingCastle-HayaoMiyazaki-StudioGhibli-JapaneseAnimatedMoviePoster.jpg?v=1733296285',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 15,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButtonWidget(
                              icon: Icons.add,
                              iconLabel: 'My List',
                              textSize: 18,
                              iconSize: 30,
                            ),
                            _PlayButton(),
                            CustomButtonWidget(
                              icon: Icons.info,
                              iconLabel: 'Info',
                              textSize: 18,
                              iconSize: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
  }

TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () {},
      label: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      icon: Icon(Icons.play_arrow, color: Colors.black, size: 22),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(kWhiteColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(side: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}



