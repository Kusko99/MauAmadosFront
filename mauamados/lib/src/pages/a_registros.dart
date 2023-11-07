import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Registros extends StatefulWidget {
  @override
  _RegistrosState createState() => _RegistrosState();
}

class _RegistrosState extends State<Registros> {
  Future<void> submitForm() async {
    final userData = {
      "ma_id": 277,
      "name": "Louis",
      "profile_picture": [
        "https://img.freepik.com/fotos-gratis/um-passaro-com-a-palavra-aguia-nas-asas_1340-33393.jpg?size=626&ext=jpg&ga=GA1.1.1880011253.1699056000&semt=sph"
      ],
      "age": 20,
      "course": "string",
      "bio": "string",
      "genero": "masculino",
      "sexual_orientation": "heterosexual",
      "tags_preferences": ["string"],
      "match": [],
      "likes": [],
      "login": "login",
      "senha": "senha"
    };

    final jsonData = jsonEncode(userData);

    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/user'),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 200) {
      // Lidar com a resposta da API em caso de sucesso
    } else {
      // Lidar com erros da solicitação
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture as Informações'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: submitForm,
          child: Text('Enviar Requisição POST'),
        ),
      ),
    );
  }
}