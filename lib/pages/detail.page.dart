import 'package:flutter/material.dart';
import 'package:transerv_movie_list/model/movie.model.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;
  final int movieId;
  final bool isPoster;

  DetailPage({this.movie,this.movieId, this.isPoster});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400.0,
              floating: false,
              pinned: true,        
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(this.movie.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Hero(
                  tag: "movieId${this.movieId}",
                  child: this.isPoster ? 
                    Image.network(
                        this.movie.poster,
                        fit: BoxFit.cover,
                    )
                    :
                    Image.asset(
                        "assets/images/default-movie.jpg",
                        fit: BoxFit.cover,
                    ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  Text(this.movie.plot)
                ],
              ),
              ListTile(
                title: Text(
                  "People",
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text("Director"),
                subtitle: Text(this.movie.director),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Writer"),
                subtitle: Text(this.movie.writer),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text("Actors"),
                subtitle: Text(this.movie.actors),
              ),
              ListTile(
                title: Text(
                  "Time",
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Year"),
                subtitle: Text(this.movie.year),
              ),
              ListTile(
                leading: Icon(Icons.event),
                title: Text("Released"),
                subtitle: Text(this.movie.released),
              ),
              ListTile(
                leading: Icon(Icons.timeline),
                title: Text("Runtime"),
                subtitle: Text(this.movie.runtime),
              ),
              ListTile(
                title: Text(
                  "Statistics",
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              ListTile(
                leading: Icon(Icons.rate_review),
                title: Text("Rated"),
                subtitle: Text(this.movie.rated),
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text("Genre"),
                subtitle: Text(this.movie.genre),
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text("Language"),
                subtitle: Text(this.movie.language),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text("Awards"),
                subtitle: Text(this.movie.awards),
              ),
            ],
          ),
        ),
      ),
    );
  }
}