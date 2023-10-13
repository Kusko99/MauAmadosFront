import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> userPhotos = User.users[0].urlFotos;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  toolbarHeight: deviceHeight * 0.08,
                ),
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
                          });
                        },
                      ),
                    if (userPhotos.length < 9)
                      ...List.generate(
                        9 - userPhotos.length,
                        (index) => ImageButton(
                          onPressed: () => showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => BuildImagePicker(
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}