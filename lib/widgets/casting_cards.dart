

import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      //color: Colors.red,
      margin: const EdgeInsets.only(bottom: 30),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (_, index) => const _CastCard()
      )
   );
    
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard();

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
            child: const FadeInImage(
              placeholder: AssetImage("assets/load.gif"),
               image: NetworkImage("https://via.placeholder.com/150x300.jpg"),
               height: 140,
               width: 100,
               fit: BoxFit.cover,
            ),
          ),
          const Text("Actor.name De puerba XD", maxLines: 2,overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}