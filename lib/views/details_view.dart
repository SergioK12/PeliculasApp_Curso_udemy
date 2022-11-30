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
           CustomSliverAppbar( imagenfondo: movie.backdropPath!),
          SliverList(
            delegate: SliverChildListDelegate([
              //Text(movie.title),
              PosterAndTitle(lapeli: movie),
              _Overview(),
              _Overview(),
              const CastingCards()
              //const SizedBox(height: 20,),
              
            ])
        )
        ],
      )
    );
  }
}

class CustomSliverAppbar extends StatelessWidget {

  final String imagenfondo;
  const CustomSliverAppbar({super.key, required this.imagenfondo});

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      pinned: true,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          alignment: Alignment.bottomCenter,
          width:double.infinity ,
          padding: const EdgeInsets.only(bottom: 5),
          child: const Text("Imagen.data", style: TextStyle(fontSize: 16),),
        ),
        background:  FadeInImage(
          placeholder: AssetImage("assets/load.gif"),
          image: NetworkImage(imagenfondo),
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
  final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:  FadeInImage(
              placeholder:  const AssetImage("assets/load.gif"),
              image: NetworkImage(lapeli.fullposterImage),
              height: 150,
            ),
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text("${ lapeli.title} ", style: textTheme.headline5, overflow: TextOverflow.ellipsis,maxLines: 2,),
              Text("Este es un subtitulo", style: textTheme.subtitle1, overflow: TextOverflow.ellipsis,),
              Row(
                children: [
                  const Icon(Icons.star_outline_sharp, color: Colors.greenAccent,),
                  const SizedBox(width: 5,),
                  Text("Una pequeña descripcion", style: textTheme.caption,),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(10),
      child:  Text(
        "Desde pequeños nuestros padres tratan de inculcarnos los hábitos que van a formar parte de nuestra vida. La presión por elegirlos es enorme, ya que determina el carácter que tendremos de adultos.Un ejemplo claro: Si le enseñas a un niño a ahorrar, crecerá con esta mentalidad y lo hará de forma inconsciente. Pero, si durante años crece con la idea de que despilfarrar está bien, crecerá como un adulto incapaz de generar ahorros. ",
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.justify,
      ),
    );
  }
}