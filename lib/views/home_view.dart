
import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const  Text("Peliculas en cine"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){},
          ),  
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
         children: const [
          CardSwiper(),
          MovieSlider(),
           
         ],
        ),
      ),
    );
  }
}