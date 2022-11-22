import 'package:flutter/material.dart';
import 'views/views.dart';

void main() {
  runApp(const MyApp());
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


