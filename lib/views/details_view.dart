import 'package:app_peliculas/models/models.dart';
import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
   
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    return Scaffold(
      //appBar: AppBar(title: const Text("Detalles"),centerTitle: true,),
      body:  CustomScrollView(
        slivers: [
           CustomSliverAppbar( movie: movie),
          SliverList(
            delegate: SliverChildListDelegate([
              //Text(movie.title),
              PosterAndTitle(lapeli: movie),
              _Overview(descripcion: movie.overview.toString()),
              
              CastingCards( movieId: movie.id)
              //const SizedBox(height: 20,),
              
            ])
        )
        ],
      )
    );
  }
}

class CustomSliverAppbar extends StatelessWidget {

  final Movie movie;
  const CustomSliverAppbar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      pinned: true,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.bottomCenter,
            width:double.infinity ,
            padding: const EdgeInsets.only(bottom: 5),
            child:  Text(movie.title, style: const TextStyle(fontSize: 16),textAlign: TextAlign.center,),
          ),
        ),
        background:  FadeInImage(
          placeholder: const AssetImage("assets/load.gif"),
          image: NetworkImage(movie.fullBackDropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PosterAndTitle extends StatelessWidget {
  final Movie lapeli;
  const PosterAndTitle({super.key, required this.lapeli});


  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: lapeli.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  FadeInImage(
                placeholder:  const AssetImage("assets/load.gif"),
                image: NetworkImage(lapeli.fullposterImage),
                height: 150,
              ),
            ),
          ),
          const SizedBox(width: 20,),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - (size.width * 0.5) ) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                    lapeli.title,
                    textDirection: TextDirection.ltr,
                    style: textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                ),
                Text(
                  lapeli.originalTitle,
                  style: textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_outline_sharp, color: Colors.greenAccent,),
                    const SizedBox(width: 5,),
                    Text("8.5", style: textTheme.headlineLarge,),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final  String descripcion;

  const _Overview({required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(10),
      child:  Text(
      descripcion,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.justify,
      ),
    );
  }
}