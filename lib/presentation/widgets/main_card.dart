import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/Controller/model_class.dart';

class MainCard extends StatelessWidget {
  final String? image;
  MainCard({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          width: 134,
          height: 200,
          child: Image.network(
            imageBase + image!,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator(color: Colors.white,));
            },
            errorBuilder: (context, error, StackTrace) {
              return const Center(child: Icon(Icons.error, color: Colors.red));
            },
          ),
        ),
      ),
    );
  }
}
