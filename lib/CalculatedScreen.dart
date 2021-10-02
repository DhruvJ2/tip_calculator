import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CalculatedScreen extends StatefulWidget {
  CalculatedScreen({
    Key? key,
    required this.current_currency,
    required this.amount,
  }) : super(key: key);

  final String current_currency;
  final double amount;

  @override
  _CalculatedScreenState createState() => _CalculatedScreenState();
}

class _CalculatedScreenState extends State<CalculatedScreen>{

  String DisplayCurrency(){
    switch(widget.current_currency){
      case "USD" :
        return '\$';
      case "EUR":
        return '€';
      case "YEN":
        return '¥';
      case "CAD":
        return 'C\$';
      default:
        return '₹';
    }
    // if(widget.current_currency=="USD"){
    //   return '\$';
    // }
    // else if(widget.current_currency=="EUR"){
    //   return '€';
    // }
    // else if(widget.current_currency=="YEN"){
    //   return '¥';
    // }
    // else if(widget.current_currency=="CAD"){
    //   return 'C\$';
    // }
    // else{
    //   return '₹';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red.shade600 , Colors.orange ],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    stops: [0.0,1.0],
                  ),
                ),
                child:Center(
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AnimatedTextKit(
                            totalRepeatCount: 1,
                            animatedTexts:[
                              TypewriterAnimatedText(
                                'Calculated Tip is  ${DisplayCurrency()} ${widget.amount.round()}',
                                textStyle: TextStyle(fontSize: 25.0,fontFamily:"monospace",color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                            ],
                            pause: const Duration(milliseconds: 1500),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          ),
                        ],
                      ),
                ),
              ),
            ),
            Positioned(
              left: 10.0,
              top: 10,
              child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    }, 
                    icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}