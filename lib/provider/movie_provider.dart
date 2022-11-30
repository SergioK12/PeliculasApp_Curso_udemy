import 'package:app_peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {

  final String _apiKey = "e59d1fc1ad49364684f18d36c6009ec0";
  final String _baseUrl = "api.themoviedb.org";
  final String _lenguaje =  "es-ES";
  List<Movie> onDisplaymovie = [];
  List<Movie> popularMovies = [];

  MovieProvider() {
    debugPrint("MP inicializado");

    getOnDisplayMovies();
    getPopularovies();
  }

  getOnDisplayMovies()  async{
    var url = Uri.https(
      _baseUrl,
      '3/movie/now_playing',
      {
        'api_key': _apiKey,
        'language': _lenguaje,
        'page': '1',

      }
    );
    final response = await http.get(url);
    final nowplayingresponse = NowPlayingResponse.fromJson(response.body);

    //debugPrint(nowplayingresponse.results[0].title);
    onDisplaymovie = nowplayingresponse.results;
    notifyListeners();

  }

  getPopularovies()  async {
    var url = Uri.https(
      _baseUrl,
      '3/movie/popular',
      {
        'api_key': _apiKey,
        'language': _lenguaje,
        'page': '1',

      }
    );
    final response = await http.get(url);
    final popularResponse = PopularReponse.fromJson(response.body);

    //debugPrint(nowplayingresponse.results[0].title);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();

  }
}
