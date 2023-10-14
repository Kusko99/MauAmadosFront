import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
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
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    User user = widget.user;
    List<String> userPhotos = user.urlFotos;
    double fontSize1 = widget.fontSize1;
    double fontSize2 = widget.fontSize2;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: deviceHeight * 0.08,
          leadingWidth: deviceHeight * 0.08,
          leading:IconButton(
            onPressed: (){},
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
                            user.urlFotos = userPhotos;
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal :deviceWidth * 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileData(titulo: 'Nome', data: user.nome, fontSize1: fontSize1, fontSize2: fontSize2),
                            ProfileData(titulo: 'Idade', data: user.idade.toString(), fontSize1: fontSize1, fontSize2: fontSize2),
                            ProfileData(titulo: 'Curso', data: user.curso, fontSize1: fontSize1, fontSize2: fontSize2),
                            ProfileData(titulo: 'Interesses', data: user.interesses.join(', '), fontSize1: fontSize1, fontSize2: fontSize2),
                            ProfileData(titulo: 'Bio', data: user.bio, fontSize1: fontSize1, fontSize2: fontSize2),
                          ],
                        )
                      ),
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}