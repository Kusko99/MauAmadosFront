import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class Registros3 extends StatefulWidget {
  final Map<String, dynamic> userData;
  final double fontSize;

  const Registros3({
    required this.userData,
    required this.fontSize,
    super.key
    });

    @override
    State<Registros3> createState() {
    return _RegistrosState3();
  }
}

class _RegistrosState3 extends State<Registros3> {
  TextEditingController imageLinkController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  bool isNextButtonEnabled = false;

  @override
  void dispose() {
    imageLinkController.dispose();
    interestController.dispose();
    super.dispose();
  }

  @override
  Widget build (BuildContext context){

    
  Map<String, dynamic> userData = {'ma_id': 4, 'name': 'aa', 'profile_picture': [], 'age': 22, 'course': 'Engenharia Civil', 'bio': '', 'genero': 'masculino', 'sexual_orientation': 'heterosexual',
'tags_preferences': [], 'match': [], 'likes': [], 'login': '22.22222-9@maua.br', 'senha': 22222222};
  User user = User.fromJson(widget.userData);

  Future<void> submitForm() async {
    final jsonData = jsonEncode(userData);

    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/user'),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 200) {
      // Lidar com a resposta da API em caso de sucesso
    } else {
      // Lidar com erros da solicitação
    }
  }

void addImage(String link) {
  final updatedUserPhotos = List<String>.from(user.urlFotos);
  updatedUserPhotos.add(link);
  setState(() {
    // user.urlFotos = updatedUserPhotos;
    user.urlFotos.add(link);
    isNextButtonEnabled = true;
  });
  print(user.interesses);
  print(user.urlFotos);
}

  void removeImage(String link) {
    final updatedUserPhotos = List<String>.from(user.urlFotos);
    updatedUserPhotos.remove(link);
    setState(() {
      user.urlFotos = updatedUserPhotos;
    });
    if (user.urlFotos.isEmpty) {
      setState(() {
        isNextButtonEnabled = false;
      });
    }
  }

  void removeInterest(String interesse) {
    final updatedUserInterests = List<String>.from(user.interesses);
    updatedUserInterests.remove(interesse);
    setState(() {
      user.interesses = updatedUserInterests;
    });
  }

  void addInterest(String interesse) {
    final updatedUserInterests = List<String>.from(user.interesses);
    updatedUserInterests.add(interesse);
    setState(() {
      user.interesses.add(interesse);
      // user.interesses = updatedUserInterests;
    });
  print(user.interesses);
  print(user.urlFotos);
  }

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
          'Quase lá',
          style: TextStyle(
            fontSize: max(MediaQuery.of(context).size.height * 0.035, 15.0)
          ),
          ),
        toolbarHeight: max(MediaQuery.of(context).size.height * 0.1, 36.0),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            ProfileBox(
              data: Wrap(
                alignment: WrapAlignment.center,
                spacing: 5,
                runSpacing: 5,
                children: [
                  ...user.urlFotos
                      .map((url) => ProfileImage(
                            imageUrl: url,
                            onRemove: () {
                              removeImage(url);
                            },
                          ))
                      .toList(),
                  if (user.urlFotos.length < 9)
                    ...List.generate(
                      9 - user.urlFotos.length,
                      (index) => ImageButton(
                        user: user,
                        onAdd: addImage,
                      ),
                    ),
                ],
              ),
              label: 'Adicione Imagens', 
              fontSize: widget.fontSize
            ),
            ProfileBox(
              label: 'Interesses', 
              fontSize: widget.fontSize,
              data: 
              Wrap(
                children: [
                  AddWidget(
                    iconSize: widget.fontSize,
                    onAdd: addInterest,
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 2,
                    runSpacing: 2,
                    children: user.interesses.map((interesse) {
                      return InterestsButton(
                        interesse: interesse,
                        fontSize: widget.fontSize,
                        onRemove: () => removeInterest(interesse),
                      );
                    }).toList(),
                  ),
                ],
              )
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
                        userData['profile_picture'] = user.urlFotos;
                        userData['tags_preferences'] = user.interesses;
                      });
                      submitForm();
                      print(userData);
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