import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/profile.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class ProfileEdit extends StatefulWidget{
  final User user;
  final double fontSize1;
  final double fontSize2;
  const ProfileEdit({required this.user, required this.fontSize1, required this.fontSize2, super.key});

  @override
  State<ProfileEdit> createState(){
    return _ProfileEditState();
  }
}

class _ProfileEditState extends State<ProfileEdit>{
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    List<String> userPhotos = widget.user.urlFotos;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: deviceHeight * 0.08,
          leadingWidth: deviceHeight * 0.08,
          leading:IconButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfilePage(
                  fontSize1: widget.fontSize1, 
                  fontSize2: widget.fontSize2
                ))
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
                    for (final photoUrl in userPhotos)
                      ProfileImage(
                        imageUrl: photoUrl,
                        onRemove: () {
                          final copy = List<String>.from(userPhotos);
                          copy.remove(photoUrl);
                          setState(() {
                            userPhotos = copy;
                            widget.user.urlFotos = userPhotos;
                          }
                        );
                      },
                    ),
                  if (userPhotos.length < 9)
                    ...List.generate(
                      9 - userPhotos.length,
                      (index) => const ImageButton(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24
                ),
                TextFieldWidget(
                  label: 'Nome',
                  text: widget.user.nome,
                  fontSize: widget.fontSize2,
                  onChanged: (nome) {
                    setState(() {
                       widget.user.nome = nome;
                    });
                  }
                ),
                TextFieldWidget(
                  label: 'Idade',
                  text: widget.user.idade.toString(),
                  fontSize: widget.fontSize2,
                  onChanged: (idade) {
                    setState(() {
                       widget.user.idade = int.parse(idade);
                    });
                  }
                ),
                TextFieldWidget(
                  label: 'Curso',
                  text: widget.user.curso,
                  fontSize: widget.fontSize2,
                  onChanged: (curso) {
                    setState(() {
                       widget.user.curso = curso;
                    });
                  }
                ),
                TextFieldWidget(
                  label: 'Bio',
                  text: widget.user.bio,
                  fontSize: widget.fontSize2,
                  onChanged: (bio) {
                    setState(() {
                       widget.user.bio = bio;
                    });
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}