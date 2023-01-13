import 'package:app_peliculas/models/movie.dart';
import 'package:app_peliculas/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSeacrhDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => "Buscar pelicula";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  Widget _emptyWidget() {
    return const Center(
      child: Icon(Icons.movie_creation_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("test mas$query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyWidget();
    }
    debugPrint("peticion http");

    
    final provider = Provider.of<MovieProvider>(context, listen: false);
    return StreamBuilder(
      stream: provider.suggestionStream,
      builder: (context, snapshot) {
        return FutureBuilder(
            future: provider.searchMovies(query),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return _emptyWidget();
              }
    
              final movies = snapshot.data;
    
              return ListView.builder(
                  itemCount: movies?.length,
                  itemBuilder: (context, index) =>
                      MovieItem(movie: movies![index]));
            });
      }
    );
  }
}

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${ movie.id }';
    return ListTile(
        leading: Hero(
          tag: movie.heroId!,
          child: FadeInImage(
            placeholder: const AssetImage("assets/load.gif"),
            image: NetworkImage(movie.fullBackDropPath),
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(movie.title),
        subtitle: Text(movie.originalLanguage),
        onTap: (() =>
            Navigator.pushNamed(context, 'Detalles', arguments: movie)));
  }
}
