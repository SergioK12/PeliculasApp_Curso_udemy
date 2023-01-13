import 'package:app_peliculas/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatefulWidget {
  final Function onNetxPage;
  final List<Movie> listadepelis;
  final String? titulo;
  const MovieSlider(
      {super.key,
      this.titulo,
      required this.listadepelis,
      required this.onNetxPage});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNetxPage();
      }
    });
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

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
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.listadepelis.length,
                itemBuilder: (_, index) {
                  final movie = widget.listadepelis[index];
                  //print(movie.backdropPath.toString());
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "Detalles",
                        arguments: movie),
                    child: _MoviePoster(
                      movie: movie,
                      heroid: '${widget.titulo}-$index-${movie.id}',
                    ),
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
  final String heroid;

  const _MoviePoster({required this.movie, required this.heroid,});

  @override
  Widget build(BuildContext context) {

    movie.heroId = heroid;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //color: Colors.green,
      width: 130,
      height: 190,
      child: Column(
        children: [
          GestureDetector(
            child: Hero(
              tag: movie.heroId!,
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
            ),
            onTap: () =>
                Navigator.pushNamed(context, "Detalles", arguments: movie),
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
