import 'package:flutter/material.dart';

import 'CalculatedScreen.dart';
import 'IconChanger.dart';

class Calculator_display extends StatefulWidget {
  Calculator_display({
    Key? key , 
    Icon_Changer? this.currency_icon ,
    required this.onTap ,
    required this.amount
    }) : super(key: key);

  final currency_icon;
  final Function(int) onTap;
  final int amount;

  @override
  _Calculator_displayState createState() => _Calculator_displayState();
}

class _Calculator_displayState extends State<Calculator_display> {

  late TextEditingController _controller;
  final outlineinputborder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey)
    );
  double percentage=5.0;


  @override
  void initState(){
    super.initState();
    _controller = TextEditingController(text: widget.amount == 0 ? '' : widget.amount.toString());
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children:<Widget>[
            Padding(padding:EdgeInsets.all(70.0)),
                Text(
                  'Enter Amount',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red.shade700,
                  ),
                ),
                // IconDisplay(),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                widget.currency_icon,
                SizedBox(width: 20.0,),
                Container(
                   width: 200.0,
                   child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 8 , horizontal: 8),
                      enabledBorder: outlineinputborder,
                      focusedBorder: outlineinputborder,
                    ),
                    onChanged: (text) {
                      widget.onTap(int.parse(_controller.text));
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0,),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 5,
                overlayColor: Colors.transparent,
              ),
              child: Slider.adaptive(
              activeColor: Colors.red.shade600,
              value: percentage,
              min: 0,
              max: 10,
              divisions: 10,
              label: '${percentage.round().toString()}%',
              onChanged: (double value) {
                  setState(() {
                     percentage=value;
                  });
                },
              ),
            ),
            SizedBox(height: 30.0,),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                 MaterialPageRoute(
                    builder: (context) => CalculatedScreen(amount: (percentage/100)*widget.amount),
                     fullscreenDialog: true,
                  ),
                );
              },
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 20.0,color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                side: BorderSide(style: BorderStyle.solid,color: Colors.white)
              ),
            ),
          ],
        ),
      ),
    );
  }
} 