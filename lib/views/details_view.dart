import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
   
    //TODO: Cambiar por una instancia de la clase
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'No-Movie';
    return Scaffold(
      
      //appBar: AppBar(title: const Text("Detalles"),centerTitle: true,),
      body:  CustomScrollView(
        slivers: [
          const CustomSliverAppbar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Text(movie),
              const PosterAndTitle(),
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
  const CustomSliverAppbar({super.key});

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
        background: const FadeInImage(
          placeholder: AssetImage("assets/load.gif"),
          image: NetworkImage("https://via.placeholder.com/500x300.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PosterAndTitle extends StatelessWidget {
  const PosterAndTitle({super.key});

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
            child: const FadeInImage(
              placeholder:  AssetImage("assets/load.gif"),
              image: NetworkImage("https://via.placeholder.com/200x300.jpg"),
              height: 150,
            ),
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text("pelicula.nombre", style: textTheme.headline5, overflow: TextOverflow.ellipsis,maxLines: 2,),
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