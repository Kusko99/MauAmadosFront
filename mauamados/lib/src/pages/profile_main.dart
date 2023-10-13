import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class ProfileMainPage extends StatefulWidget {
  const ProfileMainPage({super.key});

  @override
  State<ProfileMainPage> createState() {
    return _ProfileMainPageState();
  }
}

class _ProfileMainPageState extends State<ProfileMainPage> {
  List<String> userPhotos = User.users[0].urlFotos;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
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
                            User.users[0].urlFotos = userPhotos;
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
                            ProfileData(titulo: 'Nome', data: User.users[0].nome),
                            ProfileData(titulo: 'Idade', data: User.users[0].idade.toString()),
                            ProfileData(titulo: 'Curso', data: User.users[0].curso),
                            ProfileData(titulo: 'Interesses', data: User.users[0].interesses.join(', ')),
                            ProfileData(titulo: 'Bio', data: User.users[0].bio),
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
