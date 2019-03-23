import 'package:flutter/material.dart';
import 'package:transerv_movie_list/model/movie.model.dart';
import 'package:transerv_movie_list/services/service.provider.dart';
import 'package:transerv_movie_list/widgets/movie.list.tile.widget.dart';

void main() => runApp(MyApp());


class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transerv Movies',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transerv Movies'),
        ),
        body: FutureBuilder<List<Movie>>(
          future: ServiceProvider.movieService.getMovies(),
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            if(snapshot.hasData)
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
              return MovieListTileWidget(movie: snapshot.data[index],movieId: index,);
             },
            );
            else
              return Center(
                child: Text("Loading..."),
              );
          },
        ),
      ),
    );
  }
  
}
