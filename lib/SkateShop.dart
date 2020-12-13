import 'dart:async';

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';


class SkateShop extends StatefulWidget {
  @override
  _SkateShopState createState() => _SkateShopState();
}

class _SkateShopState extends State<SkateShop> {
  List<SkateBoard> data = null;
    

 @override
  Widget build(BuildContext context) {
    if (data == null) 
    {
      return Scaffold(
              body: Center(
                  child: CircularProgressIndicator(),
                  ),
                ); 
    }
    return Scaffold(
      body: ListView(
        children: <Widget>[
          for(SkateBoard board in data)
            SkateItemWidget(
              title33: "SLIME MONSTER",
              imagePath33: board.imagePath,
              price33: "\$ 240",
              colors: board.colors,
          ),
          
                  ],
                )
              );
            }
@override
  void initState(){
    super.initState();

    _initializeColors().then((lista) {
      setState(() {
        data = lista;
      });
      });
    }

  Future<List<SkateBoard>> _initializeColors() async {
    var imagenes = ["board1.png","board2.png","board3.png","board4.png","board5.png","board6.png",];
    
    List<SkateBoard> lista = [];

    for (String image in imagenes) {
      String imagePath = "assets/$image";
      PaletteGenerator colores = await PaletteGenerator.fromImageProvider(AssetImage(imagePath));
      lista.add(SkateBoard(imagePath, colores.dominantColor));
    }
    return lista;
  }
}

class SkateBoard{// nueva estructura
  final String imagePath;
  final PaletteColor colors;

  SkateBoard(this.imagePath, this.colors); // constructor

}
          
class SkateItemWidget extends StatelessWidget {
  final String title33;
  final String imagePath33;
  final String price33;
  final PaletteColor colors;

  const SkateItemWidget({Key key, this.title33, this.imagePath33, this.price33, this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.color,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Stack(
          children: <Widget>[
            Positioned( // posiciona el texto superior
              left: 0,
              right: 0,
              top: 0,
              child: Text(title33,textAlign: TextAlign.center, style: TextStyle(color: colors.titleTextColor, letterSpacing: 10,fontWeight: FontWeight.bold),)// centra texto
              ),
            
            Positioned( // posiciona el texto inferior
              left: 0,
              right: 0,
              bottom: 0,
              child: Text(price33,textAlign: TextAlign.center, style: TextStyle(color: colors.titleTextColor, letterSpacing: 10,fontWeight: FontWeight.bold),)// centra texto
              ),
            
            RotatedBox(
              quarterTurns: 3, // gira la imagen un cuarto a la derecha
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 50,
                        

                      )
                    ]
                  ),
                  child: Image.asset(imagePath33)) // centra la imagen
              ),
             ),
          ],
        ),
      ),
    );
  }

  


}