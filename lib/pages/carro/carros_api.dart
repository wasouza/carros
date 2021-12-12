import 'package:carros/pages/carro/carro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    var url = Uri.https('carros-springboot.herokuapp.com', '/api/v1/carros/tipo/$tipo');

    var response = await http.get(url);

    String json = response.body;
    // print(json);

    List list = convert.json.decode(json);

    // final carros = <Carro>[];

    // for (Map<String, dynamic> map in list){
    //   Carro c = Carro.fromJson(map);
    //   carros.add(c);
    // }
    return list.map<Carro>((map) => Carro.fromJson(map)).toList();
  }
}
