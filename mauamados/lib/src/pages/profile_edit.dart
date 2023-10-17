import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'package:mauamados/src/widgets/widgets.dart';

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
  List<String> userPhotos = [];
  TextEditingController imageLinkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userPhotos = List<String>.from(widget.user.urlFotos);
  }

  @override
  void dispose() {
    imageLinkController.dispose();
    super.dispose();
  }

  void addImage(String link) {
    final updatedUserPhotos = List<String>.from(userPhotos);
    updatedUserPhotos.add(link);
    setState(() {
      userPhotos = updatedUserPhotos;
      widget.user.urlFotos = updatedUserPhotos;
    });
  }

  void removeImage(String link) {
    final updatedUserPhotos = List<String>.from(userPhotos);
    updatedUserPhotos.remove(link);
    setState(() {
      userPhotos = updatedUserPhotos;
      widget.user.urlFotos = updatedUserPhotos;
    });
  }

  @override
  Widget build(BuildContext context) {
    String generoSelecionado = widget.user.genero;
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
                    ...userPhotos
                        .map((url) => ProfileImage(
                              imageUrl: url,
                              onRemove: () {
                                removeImage(url);
                              },
                            ))
                        .toList(),
                    if (userPhotos.length < 9)
                      ...List.generate(
                        9 - userPhotos.length,
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
                        setState(() {
                          widget.user.idade = int.parse(idade);
                        });
                      },
                    ),
                    TextFieldWidget(
                      label: 'Curso',
                      text: widget.user.curso,
                      fontSize: widget.fontSize2,
                      onChanged: (curso) {
                        setState(() {
                          widget.user.curso = curso;
                        });
                      },
                    ),
                    TextFieldWidget(
                      label: 'Bio',
                      text: widget.user.bio,
                      fontSize: widget.fontSize2,
                      onChanged: (bio) {
                        setState(() {
                          widget.user.bio = bio;
                        });
                      },
                    ),
                    DropDownMenu(
                      label: 'Genero',
                      items: const ['Homem', 'Mulher', 'Outro'], 
                      fontSize: widget.fontSize2, 
                      selectedItem: generoSelecionado, 
                      onChanged: (value){
                        setState(() {
                          generoSelecionado = value;
                          widget.user.genero = generoSelecionado;
                        });
                      }
                    ),
                    DropDownMenu(
                      label: 'Orientação',
                      items: const ['Heterosexual', 'Homosexual', 'Outro'], 
                      fontSize: widget.fontSize2, 
                      selectedItem: orientacaoSelecionada, 
                      onChanged: (value) {
                        setState(() {
                          orientacaoSelecionada = value;
                          widget.user.orientacao = orientacaoSelecionada;
                        });
                      } , 
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
