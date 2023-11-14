import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'package:mauamados/src/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class Registros3 extends StatefulWidget {
  final Map<String, dynamic> userData;
  final double fontSize;
  final User user;
  final double fontSize1;
  final double fontSize2;

  const Registros3({
    required this.userData,
    required this.fontSize,
    required this.user,
    required this.fontSize1,
    required this.fontSize2,
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

    
  Map<String, dynamic> userData = widget.userData;

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
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MainScreen(
            idUsuarioAtual: 0,
            fontSize1: widget.fontSize1,
            fontSize2: widget.fontSize2,
          )
        )
      );
    } else {
      // Lidar com erros da solicitação
    }
  }

void addImage(String link) {
  final updatedUserPhotos = List<String>.from(widget.user.urlFotos);
  updatedUserPhotos.add(link);
  setState(() {
    widget.user.urlFotos.add(link);
    isNextButtonEnabled = true;
  });
}

  void removeImage(String link) {
    final updatedUserPhotos = List<String>.from(widget.user.urlFotos);
    updatedUserPhotos.remove(link);
    setState(() {
      widget.user.urlFotos = updatedUserPhotos;
    });
    if (widget.user.urlFotos.isEmpty) {
      setState(() {
        isNextButtonEnabled = false;
      });
    }
  }

  void removeInterest(String interesse) {
    final updatedUserInterests = List<String>.from(widget.user.interesses);
    updatedUserInterests.remove(interesse);
    setState(() {
      widget.user.interesses = updatedUserInterests;
    });
  }

  void addInterest(String interesse) {
    final updatedUserInterests = List<String>.from(widget.user.interesses);
    updatedUserInterests.add(interesse);
    setState(() {
      widget.user.interesses.add(interesse);
    });
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
            Text(
              'Adicione uma Foto',
              style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: widget.fontSize,
                color: const Color.fromARGB(255, 0, 71, 133)
              )
            ),
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
                    children: widget.user.interesses.map((interesse) {
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
                        userData['profile_picture'] = widget.user.urlFotos;
                        userData['tags_preferences'] = widget.user.interesses;
                      });
                      submitForm();
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