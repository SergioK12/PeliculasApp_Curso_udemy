import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalles"),centerTitle: true,),
      body: Center(
        child: Column(
          children: const  [
            Text("Detalles")
          ],
        ),
      ),
    );
  }
}