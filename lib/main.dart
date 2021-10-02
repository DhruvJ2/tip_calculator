
import 'package:flutter/material.dart' ;

import 'Calculator_display.dart';
import 'IconChanger.dart';

void main() => runApp(TipCalculator());

class TipCalculator extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Tip Calculator',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<String> currency = ["INR","USD","EUR","YEN","CAD"];
  Icon_Changer currency_icon=Icon_Changer(current_currency: '');
  String currentcurrency='₹';

  int amount=0;

  void setAmount(int amt){
    setState(() {
      amount=amt;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        // color: Colors.red,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[Colors.red.shade900 , Colors.orange.shade600],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.topRight,
            stops: [0.0,1.0]
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Tip Calculator',
                      style: TextStyle(fontSize: 25.0, color: Colors.white,),
                    ),
                  ],
                ),
                // SizedBox(height: 20.0,),
                Container(
                  height: 70.0,
                  child: ListView.builder(
                    itemCount: currency.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index){
                      return Container(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              currentcurrency=currency[index];
                              currency_icon=Icon_Changer(current_currency: currency[index]);
                            });
                          },
                          child: Card(
                            margin:EdgeInsets.all(18.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18.0)
                              ),
                              height: 300.0,
                              width: 150.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    currency[index],
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize:16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // SizedBox(height: 40.0,),
                Expanded(
                  child: Container(
                    height: size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0) ,
                        topRight: Radius.circular(30.0), 
                        ),
                      color: Colors.white,
                    ),
                    child: Calculator_display(
                      currentcurrency: currentcurrency,
                      currency_icon: currency_icon,
                      onTap: setAmount,
                      amount: amount,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





