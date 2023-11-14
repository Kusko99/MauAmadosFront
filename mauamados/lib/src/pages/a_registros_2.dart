import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class Registros2 extends StatefulWidget {
  final double fontSize;
  final String email;
  final String senha;
  final String nome;
  final int idade;
  final User user;

  const Registros2({
    required this.fontSize,
    required this.email, 
    required this.senha, 
    required this.nome, 
    required this.idade,
    required this.user,
    super.key, 
    });

  @override
    State<Registros2> createState() {
    return _RegistrosState2();
  }
}

class _RegistrosState2 extends State<Registros2> {
  TextEditingController bioController = TextEditingController();
  TextEditingController cursoController = TextEditingController();
  String generoSelecionado = '--Selecione--';
  String orientacaoSelecionada = '--Selecione--';
  String cursoSelecionado = '--Selecione--';
  bool generoValidator = false;
  bool orientacaoValidator = false;
  bool cursoValidator = false;
  bool isNextButtonEnabled = false;

  Map<String, dynamic> userData = {};

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
          'Definindo perfil',
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
            DropDownMenu(
              label: 'Genero',
              items: const ['--Selecione--', 'Masculino', 'Feminino', 'Não-Binário'], 
              fontSize: widget.fontSize, 
              selectedItem: generoSelecionado, 
              onChanged: (value){
                setState(() {
                  generoSelecionado = value;
                });
                if (value == '--Selecione--') {
                  setState(() {
                    generoValidator = false;
                    isNextButtonEnabled = false;
                  });
                } else {
                  setState(() {
                    generoValidator = true;
                  });
                  if (generoValidator && orientacaoValidator && cursoValidator) {
                    setState(() {
                      isNextButtonEnabled = true;
                    });
                  }
                }
              }
            ),
            DropDownMenu(
              label: 'Orientação',
              items: const ['--Selecione--','Heterossexual', 'Homossexual', 'Bissexual'], 
              fontSize: widget.fontSize, 
              selectedItem: orientacaoSelecionada,
              onChanged: (value) {
                setState(() {
                  orientacaoSelecionada = value;
                });
                if (value == '--Selecione--') {
                  setState(() {
                    orientacaoValidator = false;
                    isNextButtonEnabled = false;
                  });
                } else {
                  setState(() {
                    orientacaoValidator = true;
                  });
                  if (generoValidator && orientacaoValidator && cursoValidator) {
                    setState(() {
                      isNextButtonEnabled = true;
                    });
                  }
                }
              } , 
            ),
            DropDownMenu(
              label: 'Curso',
              items: const ['--Selecione--','Administração', 'Arquitetura e Urbanismo', 'Ciência da Computação', 'Design', 
              'Engenharia Civil', 'Engenharia de Alimentos', 'Engenharia de Computação', 'Engenharia de Controle e Automoção',
              'Engenharia de Produção', 'Engenharia Elétrica', 'Engenharia Eletrônica', 'Engenharia Mecânica', 'Engenharia Química',
              'Inteligência Artificial e Ciência de Dados', 'Relações Internacionais', 'Sistemas de Informação', 'Professor'], 
              fontSize: widget.fontSize, 
              selectedItem: cursoSelecionado,
              onChanged: (value) {
                setState(() {
                  cursoSelecionado = value;
                });
                if (value == '--Selecione--') {
                  setState(() {
                    isNextButtonEnabled = false;
                    cursoValidator = false;
                  });
                } else {
                  setState(() {
                    cursoValidator = true;
                  });
                  if (generoValidator && orientacaoValidator && cursoValidator) {
                    setState(() {
                      isNextButtonEnabled = true;
                    });
                  }
                }
              } , 
            ),
            CustomTextField(
              controller: bioController, 
              fontSize: widget.fontSize, 
              hintText: 'Escreva uma breve descrição sobre você', 
              label: 'Bio (opcional)', 
              maxLines: null,
              minLines: 2,
              onChanged: (value) {
                setState(() {
                  
                });
              }
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
                        userData  = 
                        {
                          "ma_id": 4,
                          "name": widget.nome,
                          "profile_picture": [],
                          "age": widget.idade,
                          "course": cursoSelecionado,
                          "bio": bioController.text.isNotEmpty ? bioController.text : '',
                          "genero": generoSelecionado,
                          "sexual_orientation": orientacaoSelecionada,
                          "tags_preferences": [],
                          "match": [],
                          "likes": [],
                          "login": widget.email,
                          "senha": widget.senha
                        };
                        widget.user.curso = cursoSelecionado;
                        widget.user.genero = generoSelecionado;
                        widget.user.orientacao = orientacaoSelecionada;
                        widget.user.bio = bioController.text.isNotEmpty ? bioController.text : '';
                      });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:(context) => Registros3(
                            user: widget.user,
                            fontSize: widget.fontSize,
                            userData: userData,
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
                        Text('Próximo', style: TextStyle(fontSize: widget.fontSize)),
                        Icon(
                          Icons.arrow_forward,
                          size: widget.fontSize,
                        ),
                      ],
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}