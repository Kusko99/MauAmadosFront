import 'dart:math';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'package:mauamados/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Registros extends StatefulWidget {
  final double fontSize;
  final double fontSize1;
  final double fontSize2;

  const Registros({
    required this.fontSize,
    required this.fontSize1,
    required this.fontSize2,
    super.key
    });

  @override
    State<Registros> createState() {
    return _RegistrosState();
  }
}

class _RegistrosState extends State<Registros> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  User user = User.users[0];
  late double fontSize = widget.fontSize * 0.9;
  bool isPasswordValid = false;
  bool isNameValid = false;
  bool isAgeValid = false;
  bool isEmailValid(String email) {
    final RegExp emailRegex = RegExp(r'^\d{2}\.\d{5}-\d@maua\.br$');
    return emailRegex.hasMatch(email);
  }
  bool emailValidator = false;
  bool isPasswordConfirmationValid = false;
  bool isNextButtonEnabled   = false;

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
          'Primeiros passos',
          style: TextStyle(
            fontSize: max(MediaQuery.of(context).size.height * 0.035, 15.0)
          ),
          ),
        toolbarHeight: max(MediaQuery.of(context).size.height * 0.1, 36.0),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 20
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    isNextButtonEnabled  = false;
                    isNameValid = false;
                  });
                } else {
                  setState(() {
                    isNameValid = true;
                    if (isNameValid && isAgeValid && emailValidator && isPasswordValid && isPasswordConfirmationValid) {
                      setState(() {
                        isNextButtonEnabled  = true;
                      });
                    }
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
                    isNextButtonEnabled  = false;
                    isAgeValid = false;
                  });
                } else {
                  setState(() {
                    isAgeValid = true;
                    if (isNameValid && isAgeValid && emailValidator && isPasswordValid && isPasswordConfirmationValid) {
                      setState(() {
                        isNextButtonEnabled  = true;
                      });
                    }
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
                    isNextButtonEnabled  = false;
                    emailValidator = false;
                  });
                } else {
                  setState(() {
                    emailValidator = true;
                    if (isNameValid && isAgeValid && emailValidator && isPasswordValid && isPasswordConfirmationValid) {
                      setState(() {
                        isNextButtonEnabled  = true;
                      });
                    }
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
                    isNextButtonEnabled  = false;
                    isPasswordValid = false;
                  });
                } else {
                  setState(() {
                    isPasswordValid = true;
                  });
                }
                if (value != passwordConfirmationController.text) {
                  setState(() {
                    isPasswordConfirmationValid = false;
                    isNextButtonEnabled  = false;
                  });
                } else {
                  setState(() {
                    isPasswordConfirmationValid = true;
                    if (isNameValid && isAgeValid && emailValidator && isPasswordValid && isPasswordConfirmationValid) {
                      setState(() {
                        isNextButtonEnabled  = true;
                      });
                    }
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
                    isNextButtonEnabled  = false;
                  });
                } else {
                  setState(() {
                    isPasswordConfirmationValid = true;
                    if (isNameValid && isAgeValid && emailValidator && isPasswordValid && isPasswordConfirmationValid) {
                      setState(() {
                        isNextButtonEnabled  = true;
                      });
                    }
                  });
                }
              },
              errorText: isPasswordConfirmationValid ? null : 'Senhas não coincidem',
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  bottom: 20
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isNextButtonEnabled ? const Color.fromARGB(255, 0, 71, 133) : Colors.grey,
                  ),
                  onPressed: () {
                    if (isNextButtonEnabled) {
                      setState(() {
                        user.nome = nameController.text;
                        user.idade = int.parse(ageController.text);
                      });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:(context) => Registros2(
                            fontSize1: widget.fontSize1,
                            fontSize2: widget.fontSize2,
                            user: user,
                            fontSize: fontSize,
                            email: emailController.text,
                            senha: passwordController.text,
                            nome: nameController.text,
                            idade: int.parse(ageController.text),
                          ),
                        )
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Próximo', style: TextStyle(fontSize: fontSize)),
                        Icon(
                          Icons.arrow_forward,
                          size: fontSize,
                        ),
                      ],
                    ),
                  )
                ),
              ),
            )
          ],
        ),
       )
    );
  }
}