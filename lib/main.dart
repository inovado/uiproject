import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SkatePage(),
    );
  }
}

class SkatePage extends StatefulWidget {
  SkatePage({Key key}) : super(key: key);

  @override
  _SkatePageState createState() => _SkatePageState();
}
//--------------------------------PAINTERS----------------------------------
class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas , Size size) {
      
      final Paint paint = Paint();
      paint.color = Colors.lightBlue;
      final Rect rect = Rect.fromLTWH(0, 0, size.width * 0.25, size.height);
      
      canvas.drawRect(rect, paint);
    }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate){
      return true;
    }

}

class TroqueladoPaint extends CustomPainter {
  @override
  void paint(Canvas canvas , Size size) {

     final Paint paint = Paint();
      paint.color = Colors.white;
     
     var x = size.height / 6;
     var path = Path();
     path.moveTo(0, -x);
     
     for (var i = 0; i < 4; i++) {
        path.relativeLineTo(x, x);
        path.relativeLineTo(-x, x);
     }
     path.close();
     canvas.drawPath(path, paint);
     

    }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate){
      return true;
    }

}

//--------------------------------PAINTERS----------------------------------

class _SkatePageState extends State<SkatePage> {
  @override
  Widget build(BuildContext context) {
       
    return Scaffold(
       backgroundColor: Colors.white,
       body: CustomPaint(
         painter: BluePainter(),
           child: SafeArea(
             bottom: false,
              child: Column(
                children: <Widget>[
                  appBar(context),// appbar personalizada no tiene que ver con la funcion Appbar
                  content(context),
                  button(),
                ],
              )),
       ),
    );
  }
}

Widget appBar(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MaterialButton(
          onPressed: () {},
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 32.0,
          ),
        ),
        SizedBox(
          width: 48,
        ),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 8,
              ),
              Text(
                "SLIME MONSTER",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline1
                    .copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  letterSpacing: 14,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }


Widget content(BuildContext context){
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 32.0, top: 32.0, bottom: 32.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 140,
            height: double.infinity,
            //color: Colors.red,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/board1.png"),
                fit: BoxFit.contain, 

              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 32, top: 48, bottom: 48),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: Text("Handmade skateboard desk with original painting from Mexico",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 22.0,
                          ),
                        ),
                  ),
                  Expanded(child: Container()),
                  Divider(),
                  Expanded(child: Container()),
                  Text(" SIZE ",style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          //letterSpacing: 8,
                          color: Colors.grey,
                          ),
                        ),
                  Text("8\" x 32\"",style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 22.0,
                          ),
                        ),
                  Expanded(child: Container()),
                  Text("MATERIAL",style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          //letterSpacing: 8,
                          color: Colors.grey,
                          ),
                        ),
                  Text("Canadian Maple",style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 22.0,
                          ),
                        ),
                  Expanded(flex: 3, child: Container()),
                  
                  Container(
                        width: double.infinity,
                        height: 48,
                        color: Colors.blueGrey,
                        alignment: Alignment.centerLeft,
                        child: CustomPaint(
                          painter: TroqueladoPaint(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              "\$240",
                              style:
                              Theme
                                  .of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 10,
                                fontSize: 30.0
                                ),
                              ),
                      ),
                    ),
                  ),
                  

                ],
              ),
            ),
          )

        ],
      ),
    )
  );
}

Widget button(){
  return Container(
    width: double.infinity,
    height: 120,
    //color: Colors.black,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        topLeft: Radius.circular(50),
      )

    ),
    child: FlatButton(
      onPressed: (){

      }, 
      child: Text("ADD TO CART", 
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          letterSpacing: 10
                  
      ),
    ),
  ),
      
);
}
