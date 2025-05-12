

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/presentation/Controller/model_class.dart';

class MovieService{
  static const _apiKey='e0febde05201f4539dbc9e81897664af';
  static const _baseUrl='https://api.themoviedb.org/3/movie/';
  static const _nowplaying =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=f0f46b532513ee4aab46515cf5603265';
  static const _upcoming =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=f0f46b532513ee4aab46515cf5603265';

  static String _popular =
      'https://api.themoviedb.org/3/movie/popular?api_key=f0f46b532513ee4aab46515cf5603265';

static String _topRated='https://api.themoviedb.org/3/movie/top_rated?api_key=f0f46b532513ee4aab46515cf5603265';


static Future<List<Movie>> getNowPlayingMovies() async{
  try {
    final response=await http.get(Uri.parse(_nowplaying));
    if(response.statusCode==200){
      final List<dynamic> data=jsonDecode(response.body)['results'];
      return data.map((json)=>Movie.fromJson(json)).toList().cast<Movie>();
    }
  } catch (e) {
    print('Error fetching data $e');

  }
  return [];
}

static Future<List<Movie>> getUpcomingMovies()async{
  try {
    final response=await http.get(Uri.parse(_upcoming));
    if(response.statusCode==200){
      final List<dynamic> data=jsonDecode(response.body)['results'];
      return data.map((json)=>Movie.fromJson(json)).toList().cast<Movie>();

    }
  } catch (e) {
    print('Error fetching data $e');
    
  }
  return [];
}

static Future<List<Movie>> getPopularMovies()async{
  try {
    final response= await http.get(Uri.parse(_popular));
  if(response.statusCode==200){
    final List<dynamic> data=jsonDecode(response.body)['results'];
    return data.map((json)=>Movie.fromJson(json)).toList().cast<Movie>();

  }

   } catch (e) {
    print('Error fetching data $e');
  }
  return [];
}


 static Future<List<Movie>> getTopRatedMovies () async{
   try {
      final response = await http.get(Uri.parse(_topRated));
    if(response.statusCode==200){
      final List<dynamic> data = jsonDecode(response.body)['results'];
      return data.map((json)=>Movie.fromJson(json)).toList().cast<Movie>();
   } }
   
   catch (e) {
     print("Error fetching data $e");
   }
   return [];
    }
  }

    
 





