import 'package:app_peliculas/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/views.dart';
void main() {
  runApp(const AppState());
}

class AppState  extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:  [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => MovieProvider(),
        
        )
        
    ],
    child: const MyApp(),);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas App',
      initialRoute: 'Home',
     routes: {
      'Home':(context) => const HomeView(),
      'Detalles':(context) => const DetailsView(),
     },
     theme: ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        color: Colors.red
      )
     ),
      
    );
  }
}

