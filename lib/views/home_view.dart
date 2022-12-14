import 'package:app_peliculas/provider/movie_provider.dart';
import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../search/search_delegate.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final providermovie = Provider.of<MovieProvider>(context);

    // /print(providermovie.onDisplaymovie);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peliculas en cine"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: ()=> showSearch(
              context: context,
               delegate: MovieSeacrhDelegate()
              ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(
              movies: providermovie.onDisplaymovie,
            ),
            MovieSlider(
              
              listadepelis: providermovie.popularMovies,
              titulo: "Populares",
              onNetxPage: () => providermovie.getPopularovies(),
            ),
          ],
        ),
      ),
    );
  }
}
