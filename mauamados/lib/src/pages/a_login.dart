import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';

class LoginPage extends StatefulWidget {
  final double fontSize1;
  final double fontSize2;

  const LoginPage({
    required this.fontSize1,
    required this.fontSize2,
    super.key
  });

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final username = usernameController.text;
    final password = passwordController.text;

    final response = await http.get(Uri.parse('http://127.0.0.1:8000/login/?username=$username&password=$password'));
    
    if (response.statusCode == 200) {

      final data = json.decode(response.body);
      final userId = int.parse(data['ID']);

      final userResponse = await http.get(
        Uri.parse('http://127.0.0.1:8000/user/$userId'),
      );

      if (userResponse.statusCode == 200) {
        final userData = json.decode(userResponse.body);
        final user = User.fromJson(userData[0]);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MainScreen(
              fontSize1: widget.fontSize1,
              fontSize2: widget.fontSize2,
              idUsuarioAtual: user.id,
            ),
          ),
        );
      } else {
        final userMessage = json.decode(userResponse.body)['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(userMessage),
          ),
        );
      }
    } else {
      final message = json.decode(response.body)['message'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: login,
                child: Text("Entrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



