import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      //color: Colors.grey,
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth:  size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: ( _ , index){
            return GestureDetector(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  placeholder: AssetImage("assets/load.gif"),
                  image: NetworkImage("https://via.placeholder.com/300x400.png"),
                  fit: BoxFit.cover,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, "Detalles", arguments: "TST"),
            );
        }
         
      
      ),
    );
  }
}
