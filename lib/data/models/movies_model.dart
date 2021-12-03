
class MoviesModel {
  int id;
  String overview, title, posterPath,backdropPath;
  num voteAverage;

  MoviesModel(
      {required this.id,
      required this.posterPath,
      required this.overview,
      required this.title,
      required this.voteAverage,
      required this.backdropPath});
  //
  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      id: json["id"],
      posterPath: json["poster_path"],
      overview: json["overview"],
      title: json["title"],
      voteAverage: json["vote_average"],
      backdropPath: json["backdrop_path"],
    );
  }
}
