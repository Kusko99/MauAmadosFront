// import 'dart:ffi';

import 'dart:math';

import 'package:mauamados/src/widgets/widgets.dart';
// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class Registros extends StatefulWidget {
  final double fontSize;

  const Registros({
    required this.fontSize,
    super.key
    });
  @override
  _RegistrosState createState() => _RegistrosState();
}

class _RegistrosState extends State<Registros> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  late double fontSize = widget.fontSize * 0.9;
  final Map<String, dynamic> userData = {};
  bool isPasswordValid = false;
  bool isNameValid = false;
  bool isAgeValid = false;
  bool isEmailValid(String email) {
    final RegExp emailRegex = RegExp(r'^\d{2}\.\d{5}-\d@maua\.br$');
    return emailRegex.hasMatch(email);
  }
  bool emailValidator = false;
  bool isPasswordConfirmationValid = false;

  // Future<void> submitForm() async {

  //   final jsonData = jsonEncode(userData);

  //   final response = await http.post(
  //     Uri.parse('http://127.0.0.1:8000/user'),
  //     headers: {
  //       'accept': 'application/json',
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonData,
  //   );

  //   if (response.statusCode == 200) {
  //     // Lidar com a resposta da API em caso de sucesso
  //   } else {
  //     // Lidar com erros da solicitação
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20)
          )
        ),
        title: Text(
          'Bem Vindo!',
          style: TextStyle(
            fontSize: max(MediaQuery.of(context).size.height * 0.05, 15.0)
          ),
          ),
        toolbarHeight: max(MediaQuery.of(context).size.height * 0.1, 36.0),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 20
        ),
        child: Column(
          children: [
            CustomTextField(
              controller: nameController, 
              fontSize: fontSize,
              hintText: 'Seu nome',
              label: 'Nome',
              errorText: isNameValid ? null : 'O nome não pode estar vazio',
              onChanged: (value) {
                if (value == '') {
                  setState(() {
                    isNameValid = false;
                  });
                } else {
                  setState(() {
                    isNameValid = true;
                  });
                }
              } ,
            ),
            CustomTextField(
              controller: ageController, 
              fontSize: fontSize,
              hintText: 'Idade',
              label: 'Idade',
              errorText: isAgeValid ? null : 'Usuários com menos de 18 anos não podem se cadastrar',
              onChanged: (value) {
                if (int.parse(value) < 18) {
                  setState(() {
                    isAgeValid = false;
                  });
                } else {
                  setState(() {
                    isAgeValid = true;
                  });
                }
              },
            ),
            CustomTextField(
              controller: emailController, 
              fontSize: fontSize,
              hintText: 'seuRA@maua.br',
              label: 'Email',
              errorText: emailValidator ? null : 'O E-mail deve ser no formato xx.xxxxx-x@maua.br',
              onChanged: (value) {
                if (!isEmailValid(value)) {
                  setState(() {
                    emailValidator = false;
                  });
                } else {
                  setState(() {
                    emailValidator = true;
                  });
                }
              },
            ),
            CustomTextField(
              controller: passwordController, 
              fontSize: fontSize,
              hintText: 'Sua senha',
              label: 'Senha',
              obscureText: true,
              errorText: isPasswordValid ? null : 'A senha deve conter pelo menos 8 caracteres',
              onChanged: (value) {
                if (value.length < 8) {
                  setState(() {
                    isPasswordValid = false;
                  });
                } else {
                  setState(() {
                    isPasswordValid = true;
                  });
                }
              } 
            ),
            CustomTextField(
              controller: passwordConfirmationController,
              fontSize: fontSize,
              hintText: 'Sua senha',
              label: 'Confirme sua senha',
              obscureText: true,
              onChanged: (value) {
                if (value != passwordController.text) {
                  setState(() {
                    isPasswordConfirmationValid = false;
                  });
                } else {
                  setState(() {
                    isPasswordConfirmationValid = true;
                  });
                }
              },
              errorText: isPasswordConfirmationValid ? null : 'Senhas não coincidem',
            )
          ],
        ),
       )
    );
  }
}