import 'package:app_peliculas/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({
    super.key,
    required this.movieId
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MovieProvider>(context, listen: false);
    return FutureBuilder(

      future: moviesProvider.getmoviecast(movieId),

      builder:  ((context, snapshot) {
        
        if(!snapshot.hasData){
          return  Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator()
              ],
            ),
          ); 
        }

        final  cast  = snapshot.data;

        return Container(
        width: double.infinity,
        height: 180,
        //color: Colors.red,
        margin: const EdgeInsets.only(bottom: 30),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (_, index) =>   _CastCard(cast[index])
          )
        );
      }
      )
    
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard(this.actor);

  final dynamic actor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 110,
      width: 100,
      //color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:  FadeInImage(
              placeholder: const AssetImage("assets/load.gif"),
              image: NetworkImage(actor.fullProfilePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
           Text(
           actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
