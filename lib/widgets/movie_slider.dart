import 'package:app_peliculas/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> listadepelis;
  final String? titulo;
  const MovieSlider({super.key, this.titulo, required this.listadepelis});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 270,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Populares",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listadepelis.length,
                itemBuilder: (_, index) {
                  final movie = listadepelis[index];
                  print(movie.backdropPath.toString());
                  return _MoviePoster(
                    movie: movie,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;

  const _MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //color: Colors.green,
      width: 130,
      height: 190,
      child: Column(
        children: [
          GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                width: 130,
                height: 190,
                placeholder: const AssetImage("assets/No.png"),
                image: NetworkImage(movie.fullposterImage),
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, "Detalles", arguments: movie.id.toString());
            },
          ),
          const SizedBox(height: 5),
           Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
