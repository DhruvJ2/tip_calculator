import 'package:flutter/material.dart';

class Icon_Changer extends StatelessWidget {
  Icon_Changer({ Key? key , required String this.current_currency}) : super(key: key);

  final String current_currency;
  
  @override
  Widget build(BuildContext context) {
    
    switch(current_currency){
    case "USD":
     return ImageIcon(AssetImage('assets/dollar.png'),size: 35,color: Colors.yellow[700],);
    case "EUR":
     return ImageIcon(AssetImage('assets/euro.png'),size: 35,color: Colors.yellow[700],);
    case "YEN":
     return ImageIcon(AssetImage('assets/yen.png'),size: 35,color: Colors.yellow[700],);
    case "CAD":
     return ImageIcon(AssetImage('assets/canadian-dollar.png'),size: 35,color: Colors.yellow[700],);
    default:
      return ImageIcon(AssetImage('assets/rupee.png'),size: 35,color: Colors.yellow[700],);
    }
  }
}