import 'package:mauamados/models/models.dart';

class UserCadastro extends User {
  User user = User(
    id: 0, 
    nome: '', 
    idade: 0, 
    urlFotos: [], 
    bio: '', 
    curso: '', 
    interesses: [] ,
    genero: '', 
    orientacao: '', 
    likes: [], 
    match: []
  );
}