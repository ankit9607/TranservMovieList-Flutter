class Movie {
  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String poster;
  String awards;

  Movie({
  this.title,
  this.year,
  this.rated,
  this.released,
  this.runtime,
  this.genre,
  this.director,
  this.writer,
  this.actors,
  this.plot,
  this.language,
  this.country,
  this.poster,
  this.awards,
  });

  Movie.fromJson(Map<String, dynamic> json){
  this.title=json['Title'];
  this.year=json['Year'];
  this.rated=json['Rated'];
  this.released=json['Released'];
  this.runtime=json['Runtime'];
  this.genre=json['Genre'];
  this.director=json['Director'];
  this.writer=json['Writer'];
  this.actors=json['Actors'];
  this.plot=json['Plot'];
  this.language=json['Language'];
  this.country=json['Country'];
  this.poster=json['Poster '] ?? json['Poster'];
  this.awards=json['Awards'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> json = Map<String, dynamic>();
    json['Title']=this.title;
    json['Year']=this.year;
    json['Rated']=this.rated;
    json['Released']=this.released;
    json['Runtime']=this.runtime;
    json['Genre']=this.genre;
    json['Director']=this.director;
    json['Writer']=this.writer;
    json['Actors']=this.actors;
    json['Plot']=this.plot;
    json['Language']=this.language;
    json['Country']=this.country;
    json['Poster ']=this.poster;
    json['Awards']=this.awards;
    return json;
  }
}