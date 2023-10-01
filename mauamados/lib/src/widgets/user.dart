import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String nome;
  final int idade;
  final List<String> urlFotos;
  final String bio;
  final String curso;
  final List interesses;

  const User({
    required this.id,
    required this.nome, 
    required this.idade, 
    required this.urlFotos, 
    required this.bio, 
    required this.curso,
    required this.interesses});

    @override
    List<Object> get props => [id, nome, idade, urlFotos, bio, curso, interesses];
}