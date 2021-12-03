import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/api_constants/constants.dart';
import 'package:movies_app/data/models/movies_model.dart';
import 'dart:convert';

class Movies with ChangeNotifier {
  Movies() {
    fetchMovies();
  }

  List<MoviesModel> listDataModel = [];

  Future<void> fetchMovies() async {
    var url = Uri.parse(
        '${ApiConstant.baseUrl}movie/now_playing?api_key=${ApiConstant.apiKey}');
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body)["results"];
    for (var i in responsebody) {
      listDataModel.add(
        MoviesModel(
          id: i["id"],
          posterPath: i["poster_path"],
          overview: i["overview"],
          title: i["title"],
          voteAverage: i["vote_average"],
          backdropPath: i["backdrop_path"],
        ),
      );
    }
    notifyListeners();
  }

}
