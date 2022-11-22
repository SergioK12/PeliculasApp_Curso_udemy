import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Populares", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
     color: Colors.green,
     width: 130,
     height: 190,
    );
  }
}