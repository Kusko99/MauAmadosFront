import 'package:equatable/equatable.dart';

class User extends Equatable {
  int id;
  String nome;
  int idade;
  List<String> urlFotos;
  String bio;
  String curso;
  List<String> interesses;

  User({
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
    User(
      id: 1,
      nome: 'Carlos',
      idade: 18,
      urlFotos: const [
        'https://media.licdn.com/dms/image/D4E03AQHgAMy3qx5SNg/profile-displayphoto-shrink_800_800/0/1683990505413?e=2147483647&v=beta&t=Jab6vrLkz8UOjKFhd_MF9RCEeg4PikNScMzosoLHAWo',
        'https://i.imgur.com/jKl53ed.jpg',
        'https://i.imgur.com/S2yFvYB.jpg',
        'https://i.imgur.com/NCwhxpu.jpg'
      ],
      bio:
          'Shrek é um ogro rabugento e nada sociável que se vê com um problema enorme: todas as criaturas de contos de fadas foram despejadas no pântano onde vive. Determinado a tirá-las dali e voltar a viver em paz, ele faz um trato com o príncipe do reino, que por sua vez precisa de alguém bruto e forte para resgatar a princesa Fiona, com quem o monarca pretende se casar para virar rei. Porém, a moça está guardada em uma torre por um dragão feroz. Se conseguir trazer a princesa, Shrek terá suas terras de volta. Assim, ele logo parte em sua missão, mas não sem a companhia de um inconveniente burro falante.',
      curso: 'Ciências da Computação',
      interesses: const [
        'Hacker',
        'Rei do Hambúrguer',
        'Daniel',
        'Moleza',
        'Fotografia',
        'Sorocaba',
        'Mesa de cabeceira'
      ],
    ),
    User(
      id: 2, 
      nome: 'Kusko', 
      idade: 23, 
      urlFotos: const [
        'https://media.licdn.com/dms/image/C4E03AQG2X0slCKzxsw/profile-displayphoto-shrink_800_800/0/1645057872487?e=2147483647&v=beta&t=xYX_sDX31TxkgS_MzQGsXoerlsyDLRDe7AeJZtTu6kE',
        'https://i.imgur.com/TkhP9s9.jpg',
        'https://i.imgur.com/phvsVTy.jpg',
        'https://i.imgur.com/PdADbF5.jpg',
        'https://i.imgur.com/uM2VQ5k.jpg',
        'https://i.imgur.com/RI6Pydk.jpg',
        'https://i.imgur.com/Mdud8MY.jpg'
      ], 
      bio: 'Oi, eu sou Goku!', 
      curso: 'Sistemas de Informação', 
      interesses: const ['Pokemon', 'Corgi', 'Terceira Idade', 'Telefone do Gabriel', 'Aparecido']
    ),
    User(
      id: 3, 
      nome: 'Gustavo', 
      idade: 20, 
      urlFotos: const [
        'https://media.licdn.com/dms/image/C4D03AQGvvLeyyIJdPw/profile-displayphoto-shrink_200_200/0/1650649757091?e=1701302400&v=beta&t=nV98UV9g16B1vvFGb_4C2uumfBYMl_U9nYWDn9YcHn4',
        'https://i.imgur.com/jINJHHn.jpg',
        'https://i.imgur.com/c2wmbA0.jpg',
        'https://i.imgur.com/6kja6e4.jpg'
      ], 
      bio: '1.63, 49kg', 
      curso: 'Ciências da Computação', 
      interesses: const [
        'Japonês', 'Honda', 'Nintendo', 'Yamaha', 'Corno', 'Banheiro do H', 'Bolinho de arroz'
      ]
    ),
    User(
      id: 4, 
      nome: 'Lucas', 
      idade: 20, 
      urlFotos: const [
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
      interesses: const [
        'Avião', 'Iberê Thenorio', 'Teodoro Sampaio', 'Pizza de Calabresa', 'Escravidão', 'W500'
      ]
    ),
    User(
      id: 5, 
      nome: 'Daniel', 
      idade: 20, 
      urlFotos: const [
        'https://media.licdn.com/dms/image/C4E03AQEbEbgzWj8Caw/profile-displayphoto-shrink_800_800/0/1653845220429?e=2147483647&v=beta&t=E7g_sVl2-0MWGywvgPYkpeuIwefTwpFch5rdHQRZiSg',
        'https://i.imgur.com/JFmQrVq.jpg',
        'https://avatars.githubusercontent.com/u/102300060?v=4',
        'https://i.imgur.com/RIF6Bzc.jpg'
      ], 
      bio: 'Você não sabe programar', 
      curso: 'Ciências da Computação', 
      interesses: const [
        'Calistenia', 'Corrida', 'Macaco', 'MAUÁritacas', 'Dev', 'Dev de novo', 'Tapioca', 'Corote', 'Álcool antes das 12h'
      ]
    ),
    User(
      id: 6, 
      nome: 'Diogo', 
      idade: 20, 
      urlFotos: const [
        'https://media.licdn.com/dms/image/C4D03AQEfSJEP1Kc7wQ/profile-displayphoto-shrink_800_800/0/1652812088679?e=2147483647&v=beta&t=BEnS7J1BtBVA13jXrhP1lIGwrHGnFjwdO6msdy1BgT0',
        'https://i.imgur.com/OzifccI.jpg',
        'https://i.imgur.com/IiBsU45.jpg',
        'https://i.imgur.com/LX5iYSL.jpg',
        'https://i.imgur.com/A6zC6Gl.jpg'
      ],
      bio: 'Diogo ou Diego?',
      curso: 'Arquitetura',
      interesses: const ['Sabedoria', 'PixelArt', 'RapTap', 'Astronauta', 'Revolução Francesa', 'Peixes do U']
    ),
    User(
      id: 7, 
      nome: 'Gabriel', 
      idade: 20, 
      urlFotos: const [
        'https://i.imgur.com/irRYYNq.jpg',
        'https://i.imgur.com/PgIyNXT.jpg',
        'https://i.imgur.com/8uWvU2u.jpg',
        'https://i.imgur.com/zhNKTWA.jpg',
        'https://i.imgur.com/2F2Y6TJ.jpg'
      ],
      bio: '+55 11 97115-0204',
      curso: 'Culinária na Anhembi',
      interesses: const ['Hambúrguer', 'Pizza', 'Morrer no D&D', 'Irmã', 'As Primas', 'Faltar', 'CPTM']
    ),
    User(
      id: 8, 
      nome: 'Raul', 
      idade: 20, 
      urlFotos: const [
        'https://i.imgur.com/WVFLumd.jpg',
        'https://i.imgur.com/Ax0vxNb.jpg',
        'https://i.imgur.com/b6VP1Ep.jpg',
        'https://i.imgur.com/6FTMryz.jpg',
        'https://i.imgur.com/m3PfJBK.jpg',
        'https://i.imgur.com/Ah3JHSQ.jpg',
        'https://i.imgur.com/11pL9Hu.jpg'
      ],
      bio: 'ZZZZZZzzzzzzzzzzzzzzzzzZZZZZZZZZZZzzzzzzzzzzzzzZZZZZZZ',
      curso: 'Ciências do sono',
      interesses: const ['Mimir', 'Tirar cochilo', 'Nanar', 'Pregar o olho', 'Modo Soneca 24h', 'Cadeira Gamer', 'Ibere Thenorio', '494']
    ),
    User(
      id: 9, 
      nome: 'Gatinha', 
      idade: 19, 
      urlFotos: const [
        'https://i.imgur.com/sJOjYHJ.jpg',
        'https://i.imgur.com/ffXi09k.jpg',
        'https://i.imgur.com/jqubRed.jpg',
        'https://i.imgur.com/0PnQPtE.jpg'
      ], 
      bio: 'Ain, aniversário do Gatinha meu', 
      curso: 'Design', 
      interesses: const ['Monster', 'Honda Civic 2004', 'Bolsonaro', 'Comunismo', 'Git Hub', 'Photoshop', 'Igor', 'Aniversário', 'Manikas'])
  ];
}