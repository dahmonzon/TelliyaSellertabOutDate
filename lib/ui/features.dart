import 'package:flutter/material.dart';
import 'package:seller_tab/dimen.dart' as dim;

class FeaturesBar extends StatelessWidget {
  Function callback;
  int nbrNewOrder ;
  List<bool> currentFeature ;

  FeaturesBar({this.callback,this.nbrNewOrder,this.currentFeature});
  @override
  Widget build(BuildContext context) {
    return Container(
          // color: Color(0xFF00233b),
          color: Color(0xFF000d1d),
          padding: EdgeInsets.all(3.0),
          width: dim.Dimen.featureBarSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              featureButton(dim.Dimen.featureHeight / 2, Icons.menu, false,callback, "menu"),
              featureButton(dim.Dimen.featureHeight, Icons.receipt, currentFeature[0],callback, "order",nbrnewMessage: this.nbrNewOrder),
              featureButton(dim.Dimen.featureHeight, Icons.assignment, currentFeature[1],callback, "product"),
              featureButton(dim.Dimen.featureHeight, Icons.person_outline, currentFeature[2],callback, "customer"),
              featureButton(dim.Dimen.featureHeight, Icons.business, currentFeature[3],callback, "provider"),
            ],
          ),
        );
  }
}

Widget featureButton(double height, IconData icon,
      bool isActive,Function call, String link, {int nbrnewMessage = 0}) {

    Widget badge = Positioned(
      top: -10,
      right: -10,
      child: Container(
        height: 25,
        width: 25,
        alignment: Alignment.center,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.purple),
        child: Text(nbrnewMessage.toString(),
            style: TextStyle(color: Colors.white)),
      ),
    );

    return GestureDetector(
          onTap: (){call(link);},
          child:  Container(
            margin: EdgeInsets.symmetric(horizontal: dim.Dimen.featureBarSize.width * 0.12),
        height: height,
        decoration: BoxDecoration(
            color: isActive ? Colors.blueGrey[300] : Colors.blueGrey[800],
            borderRadius: BorderRadius.all(Radius.circular(3.0))
        ),
        child: nbrnewMessage <= 0
              ? Icon(
                  icon,
                  color: Colors.white,
                )
              : Stack(
                alignment: Alignment.center,
                  children: <Widget>[Icon(icon, color: Colors.white), badge],
                ),
      ),
    );
  }