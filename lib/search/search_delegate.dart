import 'package:flutter/material.dart';

class MovieSeacrhDelegate extends SearchDelegate {

  @override
  String? get searchFieldLabel => "Buscar pelicula";

  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      IconButton(onPressed: ()=> query = '',
      icon: const Icon(Icons.clear),
      )
      
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton(onPressed: ()=> close(context, null),
      icon: const Icon(Icons.arrow_back),
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return  Text("test mas$query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Buscanding"),
            Icon(Icons.movie_creation_sharp),
          ],
        ),
      );

    }
      return Container();
  }
}
