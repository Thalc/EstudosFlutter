import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
 // List _dados = await getJson();
  List _dados = await jsonComplexo();
  String _body = "";

  //print(dados[1]['name']);
  for (int i = 0; i < _dados.length; i++) {
     // debugPrint(" ${_dados[i]['address']['city']}");
     // debugPrint(" ${_dados[i]['address']['geo']['lat']}");
      debugPrint(" ${_dados[i]['company']['name']}");



  }
  //_body = _dados[0]['body'];

  runApp(new MaterialApp(
      home: new Scaffold(
    appBar: new AppBar(
      title: Text("JSON"),
    ),
    body: new Center(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
//              new ListView.builder(
//                itemCount: _dados.length,
//                padding: const EdgeInsets.all(14.5),
//                itemBuilder:
//                    (BuildContext context, int posicao) {
//                  return Column(
//                    children: <Widget>[
//                      Divider(
//                        height: 5.5,
//                      ),
//                      ListTile(
//                        title: Text(
//                            "${_dados[posicao]['email']}"),
//                        subtitle: Text(
//                            "${_dados[posicao]['body']}"),
//                        leading: CircleAvatar(
//                          backgroundColor: Colors.greenAccent,
//                          child: Text(
//                              "${_dados[posicao]['email'][0]}" //[P,a,u,l,o]
//                              ),
//                        ),
//                        onTap: () => _mostraMensagem(
//                            context, _dados[posicao]['body']),
//                      )
//                    ],
//                  );
//                },
//              ),
            ],
          ),
        ],
      ),
    ),
  )));
}

void _mostraMensagem(BuildContext context, String mensagem) {
  var alert = new AlertDialog(
    title: Text('JSON'),
    content: Text(mensagem),
    actions: <Widget>[
      Center(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ),
          ],
        ),
      )
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

Future<List> getJson() async {
  String url = 'https://jsonplaceholder.typicode.com/comments';

  http.Response response = await http.get(url);
  //status code == 200 = OK
  if (response.statusCode == 200) {
    //print(json.encode(response.body));
    return json.decode(response.body);
  } else {
    throw Exception('Falhou!');
  }
}
Future<List> jsonComplexo() async {
    String url = 'https://jsonplaceholder.typicode.com/users';

    http.Response response = await http.get(url);
    //status code == 200 = OK
    if (response.statusCode == 200) {
      //print(json.encode(response.body));
      return json.decode(response.body);
    } else {
      throw Exception('Falhou!');
    }

}
