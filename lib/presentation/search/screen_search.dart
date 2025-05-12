import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constspacings.dart';
import 'package:netflix_clone/presentation/Controller/controller_movie.dart';
import 'package:netflix_clone/presentation/Controller/model_class.dart';
import 'package:netflix_clone/presentation/search/screen_search_idle.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result_page.dart';
import 'package:http/http.dart' as http;

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final controller = TextEditingController();
  List<Movie> movies = [];
  List<Movie> searchResults = [];


  Future getPopular() async {
    if (mounted) {
      movies = await MovieService.getPopularMovies();
      
    }
  }

  @override
  void initState() {
    getPopular();

    super.initState();
   
  }

  _getDatafunction() async {
    await getSearchData(controller.text);
    setState(() {});
  }

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
                controller: controller,
                onChanged: (value) {
                  getSearchData(value);
                },
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

              Expanded(
                child:
                    controller.text.isEmpty
                        ? ScreenSearchIdle(popularMovies: movies)
                        : SearchResultWidget(result: searchResults),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Movie>> searchFunction(String query) async {
    const _apiKey = 'e0febde05201f4539dbc9e81897664af';
    const baseUrl = 'https://api.themoviedb.org/3/search/movie';

    try {
      final response = await http.get(
        Uri.parse('$baseUrl?api_key=$_apiKey&query=$query'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['results'];
        return data.map((json) => Movie.fromJson(json)).toList().cast<Movie>();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future getSearchData(String query) async {
    List<Movie> searchData = await searchFunction(query);
    searchResults = searchData;
  }
}
