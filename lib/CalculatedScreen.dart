import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CalculatedScreen extends StatefulWidget {
  CalculatedScreen({
    Key? key,
    required this.amount,
  }) : super(key: key);

  final double amount;

  @override
  _CalculatedScreenState createState() => _CalculatedScreenState();
}

class _CalculatedScreenState extends State<CalculatedScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, 
                  icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                ),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
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
            child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedTextKit(
                      animatedTexts:[
                        TypewriterAnimatedText(
                          'Calculated Tip = ${widget.amount.round()}',
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
    );
  }
}