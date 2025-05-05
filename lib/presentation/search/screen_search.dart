import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constspacings.dart';
import 'package:netflix_clone/presentation/search/screen_search_idle.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result_page.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                style: TextStyle(color: kWhiteColor),
                suffixIcon: const Icon(
                  Icons.close_sharp,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              kheight15,

              // Expanded(child: const ScreenSearchIdle()),
              Expanded(child: const SearchResultWidget())
            ],
          ),
        ),
      ),
    );
  }
}
