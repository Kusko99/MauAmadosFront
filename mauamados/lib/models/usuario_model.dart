import 'package:equatable/equatable.dart';

class Usuario extends Equatable {
  final int id;
  final String nome;
  final int idade;
  final List<String> urlFotos;
  final String bio;
  final String curso;

  const Usuario({
    required this.id,
    required this.nome, 
    required this.idade, 
    required this.urlFotos, 
    required this.bio, 
    required this.curso});

    @override
    List<Object> get props => [id, nome, idade, urlFotos, bio, curso];
}