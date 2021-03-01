import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController __controlePeso = new TextEditingController();
  int radioValor = 1;
  String __nomePlaneta = "";

  double _resultadoFinal = 0.0;

  void tomaContaValorRadio(int valor){
  setState(() {
    radioValor = valor;
    switch(radioValor){
      case 0:
        _resultadoFinal = calcularPesoEmPlaneta(__controlePeso.text, 0.06);
        __nomePlaneta = "O seu peso em Plutão é: ${_resultadoFinal.toStringAsFixed(1)}";
        break;
      case 1:
        _resultadoFinal = calcularPesoEmPlaneta(__controlePeso.text, 0.38);
        __nomePlaneta = "O seu peso em Marte é: ${_resultadoFinal.toStringAsFixed(1)}";
        break;
      case 2:
        _resultadoFinal = calcularPesoEmPlaneta(__controlePeso.text, 0.91);
        __nomePlaneta = "O seu peso em Plutão é: ${_resultadoFinal.toStringAsFixed(1)}";
        break;
      default:
        __nomePlaneta = "Nada";
    }
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        centerTitle: true,
        title: Text("Planeta X"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset('assets/planet.png',
            height: 133.0,
            width: 200.0,),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: __controlePeso,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'O seu peso na Terra',
                      hintText: 'Kg',
                      icon:Icon(Icons.person_outline),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                          activeColor: Colors.black,
                          value: 0,
                          groupValue: radioValor,
                          onChanged: tomaContaValorRadio),
                      Text("Plutão",
                          style:TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),),

                      Radio<int>(
                        activeColor: Colors.red,
                        value:1,
                        groupValue: radioValor,
                        onChanged: tomaContaValorRadio,
                      ),
                      Text("Marte",
                        style:TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),),

                      Radio<int>(
                        activeColor: Colors.blue,
                        value:2,
                        groupValue: radioValor,
                        onChanged: tomaContaValorRadio,
                      ),
                      Text("Júpiter",
                        style:TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),),
                    ],
                  ),

                  //Resultado
                  Text(__controlePeso.text.isEmpty ? "Insira o seu peso" : __nomePlaneta + "Kg",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w400
                  ))

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calcularPesoEmPlaneta(String peso, double gravidadeSuperficial){
    if (int.parse(peso).toString().isNotEmpty && int.parse(peso) > 0){
      return (int.parse(peso)*gravidadeSuperficial);
    }
    else
      print("Numero errado");
  }
}
