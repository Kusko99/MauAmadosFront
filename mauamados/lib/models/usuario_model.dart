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

    static List<User> users = [
    const User(
      id: 1,
      nome: 'Carlos',
      idade: 18,
      urlFotos: [
        'https://media.licdn.com/dms/image/D4E03AQHgAMy3qx5SNg/profile-displayphoto-shrink_800_800/0/1683990505413?e=2147483647&v=beta&t=Jab6vrLkz8UOjKFhd_MF9RCEeg4PikNScMzosoLHAWo',
        'https://i.imgur.com/jKl53ed.jpg',
        'https://i.imgur.com/S2yFvYB.jpg',
        'https://i.imgur.com/NCwhxpu.jpg'
      ],
      bio:
          'Shrek é um ogro rabugento e nada sociável que se vê com um problema enorme: todas as criaturas de contos de fadas foram despejadas no pântano onde vive. Determinado a tirá-las dali e voltar a viver em paz, ele faz um trato com o príncipe do reino, que por sua vez precisa de alguém bruto e forte para resgatar a princesa Fiona, com quem o monarca pretende se casar para virar rei. Porém, a moça está guardada em uma torre por um dragão feroz. Se conseguir trazer a princesa, Shrek terá suas terras de volta. Assim, ele logo parte em sua missão, mas não sem a companhia de um inconveniente burro falante.',
      curso: 'Ciências da Computação',
      interesses: [
        'Hacker',
        'Rei do Hambúrguer',
        'Daniel',
        'Moleza',
        'Fotografia',
        'Sorocaba',
        'Mesa de cabeceira'
      ],
    ),
    const User(
      id: 2, 
      nome: 'Kusko', 
      idade: 23, 
      urlFotos: [
        'https://media.licdn.com/dms/image/C4E03AQG2X0slCKzxsw/profile-displayphoto-shrink_800_800/0/1645057872487?e=2147483647&v=beta&t=xYX_sDX31TxkgS_MzQGsXoerlsyDLRDe7AeJZtTu6kE',
        'https://i.imgur.com/TkhP9s9.jpg',
        'https://i.imgur.com/phvsVTy.jpg',
        'https://i.imgur.com/PdADbF5.jpg'
      ], 
      bio: 'Oi, eu sou Goku!', 
      curso: 'Sistemas de Informação', 
      interesses: ['Pokemon', 'Corgi', 'Terceira Idade', 'Telefone do Gabriel'] )
  ];

}