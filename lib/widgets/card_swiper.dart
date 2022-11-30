import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:app_peliculas/models/models.dart';



class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty ){
    return SizedBox(
      height: size.height * 0.5,
      width: double.infinity,
      child: const Center(
        child:  CircularProgressIndicator(),
      ),
    );

      
    } 
    return SizedBox(
      //color: Colors.grey,
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth:  size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: ( _ , index){
          final movie = movies[index];
          //debugPrint(movie.posterPath);
            return GestureDetector(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  FadeInImage(
                  
                  placeholder: const AssetImage("assets/load.gif"),
                  image: NetworkImage(movie.fullposterImage),
                  fit: BoxFit.cover,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, "Detalles", arguments: "KLKMMGV"),
            );
        }
      ),
    );
  }
}
