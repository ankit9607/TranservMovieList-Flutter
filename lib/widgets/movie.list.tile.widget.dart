import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:transerv_movie_list/model/movie.model.dart';
import 'package:transerv_movie_list/pages/detail.page.dart';

class MovieListTileWidget extends StatelessWidget {
  final Movie movie;
  final int movieId;

  MovieListTileWidget({this.movie, this.movieId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: get(this.movie.poster ?? "N/A"),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        if(snapshot.data?.statusCode==200)
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>DetailPage(movie: this.movie, movieId: this.movieId,isPoster: true,)
                )
              );
            },
            child: ListTile(
            leading: Hero(
              tag: "movieId${this.movieId}",
              child: CircleAvatar(
                backgroundImage: NetworkImage(this.movie.poster),
              ),
            ),
            title: Text(this.movie.title),
            subtitle: Text(this.movie.year+", "+this.movie.genre),
            ),
          );
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>DetailPage(movie: this.movie, movieId: this.movieId,isPoster: false,)
              )
            );
          },
          child: ListTile(
          leading: Hero(
            tag: "movieId${this.movieId}",
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/default-movie.jpg"),
            ),
          ),
          title: Text(this.movie.title),
          subtitle: Text(this.movie.year+", "+this.movie.genre),
          ),
        );
      },
    );
  }
}