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
      interesses: ['Pokemon', 'Corgi', 'Terceira Idade', 'Telefone do Gabriel']
    ),
    const User(
      id: 3, 
      nome: 'Gustavo', 
      idade: 20, 
      urlFotos: [
        'https://i.imgur.com/jINJHHn.jpg',
        'https://i.imgur.com/c2wmbA0.jpg',
        'https://i.imgur.com/6kja6e4.jpg'
      ], 
      bio: 'Gustavo?', 
      curso: 'Ciências da Computação', 
      interesses: [
        'Japonês', 'Honda', 'Nintendo', 'Yamaha', 'Corno'
      ]
    ),
    const User(
      id: 4, 
      nome: 'Lucas', 
      idade: 20, 
      urlFotos: [
        'https://media.licdn.com/dms/image/C4D03AQE1NpnztOz_yA/profile-displayphoto-shrink_800_800/0/1659984116048?e=2147483647&v=beta&t=oBCbhwFecBZCX3XpxEjGFHXn5VZNgb4BrynzPo5zR6A',
        'https://i.imgur.com/eoLu40q.jpg',
        'https://i.imgur.com/LkHKScP.jpg',
        'https://i.imgur.com/9IQVnbU.jpg',
        'https://i.imgur.com/PHZd1Hf.jpg',
        'https://i.imgur.com/QGkPs3g.jpg',
        'https://i.imgur.com/DK4FX3e.jpg'
      ], 
      bio: 'Escravo do Aero', 
      curso: 'Ciências da Computação', 
      interesses: [
        'Avião', 'Iberê Thenorio', 'Teodoro Sampaio', 'Pizza de Calabresa', 'Escravidão'
      ]
    )
  ];
}