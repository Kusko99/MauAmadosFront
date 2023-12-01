import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'package:mauamados/src/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class ProfileEdit extends StatefulWidget {
  final User user;
  final double fontSize1;
  final double fontSize2;

  const ProfileEdit({
    required this.user,
    required this.fontSize1,
    required this.fontSize2,
    super.key,
  });

  @override
  State<ProfileEdit> createState() {
    return _ProfileEditState();
  }
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController imageLinkController = TextEditingController();
  TextEditingController interestController = TextEditingController();

  @override
  void dispose() {
    imageLinkController.dispose();
    interestController.dispose();
    super.dispose();
  }

  Future<void> changeData(int id, String value, String dataType, bool idade) async {
    if (idade) {
      await http.put(Uri.parse('http://127.0.0.1:8000/user/$dataType/$id/${int.parse(value)}'));
    }
    else {
      await http.put(Uri.parse('http://127.0.0.1:8000/user/$dataType/$id/$value'));
    }
  }

  Future<void> addImageRoute(int id, String link) async {
    await http.post(Uri.parse('http://127.0.0.1:8000/user/add_photo/$id?new_photo=$link'));
  }

  Future<void> addInterestRoute(int id, String tag) async {
    await http.post(Uri.parse('http://127.0.0.1:8000/user/add_tag_preferences/$id/$tag'));
  }

  Future<void> removeInterestRoute(int id, String tag) async {
    await http.delete(Uri.parse('http://127.0.0.1:8000/user/remove_tag_preference/$id/$tag'));
  }

  Future<void> deleteImageRoute(int id, String link) async {
    final String corpo = link;
    print(corpo);
    final response = await http.delete(
      Uri.parse('http://127.0.0.1:8000/user/delete_photo/$id'),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Charset': 'utf-8'
      },
      body: jsonEncode({"photo_to_delete": corpo}),
    );
    print(response.body);
    print(response.statusCode);
  }

  void addImage(String link) {
    final updatedUserPhotos = List<String>.from(widget.user.urlFotos);
    updatedUserPhotos.add(link);
    addImageRoute(widget.user.id, link);
    setState(() {
      widget.user.urlFotos = updatedUserPhotos;
    });
  }

  void removeImage(String link) {
    final updatedUserPhotos = List<String>.from(widget.user.urlFotos);
    updatedUserPhotos.remove(link);
    deleteImageRoute(widget.user.id, link);
    setState(() {
      widget.user.urlFotos = updatedUserPhotos;
    });
  }

  void removeInterest(String interesse) {
    final updatedUserInterests = List<String>.from(widget.user.interesses);
    updatedUserInterests.remove(interesse);
    removeInterestRoute(widget.user.id, interesse);
    setState(() {
      widget.user.interesses = updatedUserInterests;
    });
  }

  void addInterest(String interesse) {
    final updatedUserInterests = List<String>.from(widget.user.interesses);
    updatedUserInterests.add(interesse);
    addInterestRoute(widget.user.id, interesse);
    setState(() {
      widget.user.interesses = updatedUserInterests;
    });
  }

  @override
  Widget build(BuildContext context) {
    String generoSelecionado = widget.user.genero;
    String cursoSelecionado = widget.user.curso;
    String orientacaoSelecionada = widget.user.orientacao;
    double deviceHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: deviceHeight * 0.08,
          leadingWidth: deviceHeight * 0.08,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    usuarioAtual: widget.user,
                    fontSize1: widget.fontSize1,
                    fontSize2: widget.fontSize2,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: const Color.fromARGB(255, 0, 71, 133),
              size: deviceHeight * 0.06,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    ...widget.user.urlFotos
                        .map((url) => ProfileImage(
                              imageUrl: url,
                              onRemove: () {
                                removeImage(url);
                              },
                            ))
                        .toList(),
                    if (widget.user.urlFotos.length < 9)
                      ...List.generate(
                        9 - widget.user.urlFotos.length,
                        (index) => ImageButton(
                          user: widget.user,
                          onAdd: addImage,
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldWidget(
                      label: 'Nome',
                      text: widget.user.nome,
                      fontSize: widget.fontSize2,
                      onChanged: (nome) {
                        changeData(
                          widget.user.id, 
                          nome,
                          'change_name',
                          false
                        );
                        setState(() {
                          widget.user.nome = nome;
                        });
                      },
                    ),
                    TextFieldWidget(
                      label: 'Idade',
                      text: widget.user.idade.toString(),
                      fontSize: widget.fontSize2,
                      onChanged: (idade) {
                        changeData(
                          widget.user.id, 
                          idade,
                          'change_age',
                          true
                        );
                        setState(() {
                          widget.user.idade = int.parse(idade);
                        });
                      },
                    ),
                    DropDownMenu(
                      items: const ['Administração', 'Arquitetura e Urbanismo', 'Ciências da Computação', 'Design', 
              'Engenharia Civil', 'Engenharia de Alimentos', 'Engenharia de Computação', 'Engenharia de Controle e Automoção',
              'Engenharia de Produção', 'Engenharia Elétrica', 'Engenharia Eletrônica', 'Engenharia Mecânica', 'Engenharia Química',
              'Inteligência Artificial e Ciência de Dados', 'Relações Internacionais', 'Sistemas de Informação', 'Professor'], 
                      fontSize: widget.fontSize2, 
                      selectedItem: widget.user.curso, 
                      onChanged: (value) {
                        changeData(
                          widget.user.id, 
                          value,
                          'change_course', 
                          false
                        );
                        setState(() {
                          cursoSelecionado = value;
                          widget.user.curso = cursoSelecionado;
                        });
                      }, 
                      label: 'Curso'
                    ),
                    TextFieldWidget(
                      label: 'Bio',
                      text: widget.user.bio,
                      fontSize: widget.fontSize2,
                      onChanged: (bio) {
                        changeData(
                          widget.user.id, 
                          bio, 
                          'change_bio',
                          false
                        );
                        setState(() {
                          widget.user.bio = bio;
                        });
                      },
                    ),
                    DropDownMenu(
                      label: 'Genero',
                      items: const ['Masculino', 'Feminino', 'Não-Binário'], 
                      fontSize: widget.fontSize2, 
                      selectedItem: generoSelecionado, 
                      onChanged: (value){
                        changeData(
                          widget.user.id, 
                          value, 
                          'change_genero', 
                          false
                        );
                        setState(() {
                          generoSelecionado = value;
                          widget.user.genero = generoSelecionado;
                        });
                      }
                    ),
                    DropDownMenu(
                      label: 'Orientação',
                      items: const ['Heterossexual', 'Homossexual', 'Bissexual'], 
                      fontSize: widget.fontSize2, 
                      selectedItem: orientacaoSelecionada, 
                      onChanged: (value) {
                        changeData(
                          widget.user.id, 
                          value, 
                          'change_sexual_orientation', 
                          false
                        );
                        setState(() {
                          orientacaoSelecionada = value;
                          widget.user.orientacao = orientacaoSelecionada;
                        });
                      } , 
                    ),
                    ProfileBox(
                      label: 'Interesses', 
                      fontSize: widget.fontSize2,
                      data: 
                      Wrap(
                        children: [
                          AddWidget(
                            iconSize: widget.fontSize2,
                            onAdd: addInterest,
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 2,
                            runSpacing: 2,
                            children: widget.user.interesses.map((interesse) {
                              return InterestsButton(
                                interesse: interesse,
                                fontSize: widget.fontSize2,
                                onRemove: () => removeInterest(interesse),
                              );
                            }).toList(),
                          ),
                        ],
                      )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
