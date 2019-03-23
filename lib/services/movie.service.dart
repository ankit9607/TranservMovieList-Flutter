import 'dart:convert';

import 'package:transerv_movie_list/model/movie.model.dart';
import 'package:http/http.dart' as http;

class MovieService {

  List<Movie> movies = List<Movie>();

  Future<List<Movie>> getMovies() async {
    //if(this.movies.length!=0)return this.movies;
    dynamic result  = await http.get("https://api.myjson.com/bins/itzx2");
    final Map<String, dynamic> parsedResult = json.decode(result.body);
    this.movies = parsedResult['movies'].map((val)=>Movie.fromJson(val)).toList().cast<Movie>();
    return this.movies;
  }
  
}