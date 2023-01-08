import 'package:app_peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {

  final String _apiKey = "e59d1fc1ad49364684f18d36c6009ec0";
  final String _baseUrl = "api.themoviedb.org";
  final String _lenguaje =  "es-ES";
  List<Movie> onDisplaymovie = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> listadeactores = {

  };
  int _popularPages = 0;

  MovieProvider() {
    debugPrint("MP inicializado");

    getOnDisplayMovies();
    getPopularovies();
  }

  Future <String> _getJsonData (String endpoint, [int page = 1]) async{
    final url = Uri.https(_baseUrl, endpoint, {
       'api_key': _apiKey,
        'language': _lenguaje,
        'page': '$page',
    });
    final response = await http.get(url);
     return response.body;
  }

  getOnDisplayMovies()  async{

    final jsonData = await _getJsonData("3/movie/now_playing");
    
    final nowplayingresponse = NowPlayingResponse.fromJson(jsonData);

    onDisplaymovie = nowplayingresponse.results;
    notifyListeners();

  }

  getPopularovies()  async {
    _popularPages++;
   final jsonData = await _getJsonData("3/movie/popular",_popularPages);
    
    final popularResponse = PopularReponse.fromJson(jsonData);

    //debugPrint(nowplayingresponse.results[0].title);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();

  }

  Future getmoviecast(int moviId) async{

    if(listadeactores.containsKey(moviId)){
      return listadeactores[moviId];
    }

    debugPrint("pidiendo info al server");
    final jsonData = await _getJsonData("3/movie/$moviId/credits");
    final creditresponse = CreditResponse.fromJson(jsonData);

    listadeactores[moviId] = creditresponse.cast;

  return creditresponse.cast;
  }
}
