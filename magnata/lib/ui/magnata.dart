import 'package:flutter/material.dart';

class Magnata extends StatefulWidget {
  @override
  _MagnataState createState() => _MagnataState();
}

class _MagnataState extends State<Magnata> {
  int _contadorGrana = 0;

  void _mandaGrana(){
    setState(() {
      //responsável pela atualização de tela
      _contadorGrana = _contadorGrana + 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Magnata"),
        backgroundColor: Colors.lightGreen,
      ),
      body: new Container(
      child: new Column(
        children: <Widget>[
          //Titutlo
          Center(
            child:Text("Fique rico!",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 29.9
            ),),
          ),
          Expanded(child: Center(
            child:Text("\$ $_contadorGrana",
            style: TextStyle(
              fontSize: 45.6,
              color: _contadorGrana >= 10000 ? Colors.blueAccent : Colors.amber,
              fontWeight: FontWeight.w700
            ),),
          )),
          Expanded(child: Center(
            child: FlatButton(onPressed: () => _mandaGrana(),
              color: Colors.lightGreen,
              textColor: Colors.white70,
              child:Text("Mais dinheiro",
              style: TextStyle(fontSize: 19.9))),
          ))
        ],
      )
    ),
    );
  }
}
