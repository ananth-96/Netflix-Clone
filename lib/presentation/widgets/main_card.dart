import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(15),
        child: Container(
                  width: 134,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://i.etsystatic.com/16952472/r/il/bf0677/1530154159/il_570xN.1530154159_97sx.jpg',
                      ),fit: BoxFit.cover
                    ),
                  ),
                ),
      ),
    );
  }
}