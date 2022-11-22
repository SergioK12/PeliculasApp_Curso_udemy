import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 270,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Populares", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          const SizedBox(
            height: 5
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ( _ ,index)=>_MoviePoster()
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
     //color: Colors.green,
     width: 130,
     height: 190,
     child: Column(
      children:  [
        GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              width:  130,
              height: 190,
              placeholder: AssetImage("assets/No.png"),
              image: NetworkImage("https://via.placeholder.com/300x400.png"),
              fit: BoxFit.cover,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, "Detalles", arguments: "XD");
          } ,
        ),
        const SizedBox(
          height: 5
        ),
        const Text(
          "Este es solo un texto para demostrar que se sale de los limites",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )
      ],
     ),
    );
  }
}