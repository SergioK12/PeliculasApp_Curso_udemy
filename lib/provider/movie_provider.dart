import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  final String _ApiKey = "e59d1fc1ad49364684f18d36c6009ec0";
  final String _BaseUrl = "api.themoviedb.org";
  final String _Lenguaje =  "es-ES";

  MovieProvider() {
    debugPrint("MP inicializado");

    getOnDisplayMovies();
  }

  getOnDisplayMovies()  async{
    var url = Uri.https(
      _BaseUrl,
      '3/movie/now_playing',
      {
        'api_key': _ApiKey,
        'language': _Lenguaje,
        'page': '1',

      }
    );
    final response = await http.get(url);

    print(response.body);

  }
}
