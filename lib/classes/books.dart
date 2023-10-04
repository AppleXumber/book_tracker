import '../flutter_flow/flutter_flow_util.dart';

class Book {
  int id;
  String title;
  String author;
  int? progress = 0;
  int pages;
  String? image;

  int? chapters;
  String? startReading =
      DateFormat("dd/MM/yyyy").format(DateTime.now()).toString();
  String? endReading = DateFormat("dd/MM/yyyy")
      .format(DateTime.now().add(Duration(days: 31)))
      .toString();
  String? synopsis;
  String? publisher;
  String? publicationDate;
  String? editionPublicationDate;
  String? language;
  int? isbn10;
  int? isbn13;
  String? type;
  String? tags;

  String? howToRead = "pages";
  String? goal;
  String? status; // toRead, reading, read

  Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.pages,
      this.chapters,
      this.synopsis,
      this.publisher,
      this.publicationDate,
      this.editionPublicationDate,
      this.isbn10,
      this.isbn13,
      this.type,
      this.howToRead,
      this.startReading,
      this.image,
      this.status,
      this.progress,
      this.language,
      this.tags,
      this.endReading,
      this.goal});

  setProgress() {
    final dayStart = DateFormat("dd/MM/yyyy").format(DateTime.now());
    print(dayStart);

    /*
    Se howToRead = paginas diárias
    Paginas diárias

    dataComeço
    +quantidadeDias (quantidadePaginas / paginasDiarias)
    =
    Datafinal
     */

    /*
    Se howToRead = Data Final
    Data final

    Data final
    -
    dataComeço
    = quantidade dias

    quantidadePaginas / quantidade dias
    = Paginas diárias
     */
  }

  void addProgress() {
    print("${this.title} diz: AddProgress");
  }

  showSummary() {}

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'progress': progress,
      'pages': pages,
      'image': image,
      'chapters': chapters,
      'startReading': startReading,
      'endReading': endReading,
      'synopsis': synopsis,
      'publisher': publisher,
      'publicationDate': publicationDate,
      'editionPublicationDate': editionPublicationDate,
      'language': language,
      'isbn10': isbn10,
      'isbn13': isbn13,
      'type': type,
      'tags': tags,
      'howToRead': howToRead,
      'goal': goal,
      'status': status,
    };
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      progress: json['progress'] is int ? json['progress'] : 0,
      pages: json['pages'],
      image: json['image'],
      chapters: json['chapters'],
      startReading: json['startReading'],
      endReading: json['endReading'],
      synopsis: json['synopsis'],
      publisher: json['publisher'],
      publicationDate: json['publicationDate'],
      editionPublicationDate: json['editionPublicationDate'],
      language: json['language'],
      isbn10: json['isbn10'],
      isbn13: json['isbn13'],
      type: json['type'],
      tags: json['tags'],
      howToRead: json['howToRead'],
      goal: json['goal'],
      status: json['status'],
    );
  }
}

Book livro = Book(
    author: "Tolkien",
    id: 1,
    image:
        "https://www.lojadobolseiro.com.br/uploads/images/2020/02/76-livro-o-hobbit-capa-smaug-j-r-r-tolkien-1582738560.jpg",
    title: "O Hobbitão",
    pages: 336,
    chapters: 21,
    isbn10: 9788595085800,
    isbn13: 8595085803,
    publisher: "HarperCollins Brasil",
    publicationDate: "21/09/1937",
    synopsis:
        "Edição com mapas, capa dura, fitilho, as ilustrações originais de J.R.R. Tolkien e um pôster de Valfenda exclusivo!\n Bilbo Bolseiro era um dos mais respeitáveis hobbits de todo o Condado até que, um dia, o mago Gandalf bate à sua porta. A partir de então, toda sua vida pacata e campestre soprando anéis de fumaça com seu belo cachimbo começa a mudar. Ele é convocado a participar de uma aventura por ninguém menos do que Thorin Escudo-de-Carvalho, um príncipe do poderoso povo dos Anãos.\n Esta jornada fará Bilbo, Gandalf e 13 anãos atravessarem a Terra-média, passando por inúmeros perigos, como os imensos trols, as Montanhas Nevoentas infestadas de gobelins ou a muito antiga e misteriosa Trevamata, até chegarem (se conseguirem) na Montanha Solitária. Lá está um incalculável tesouro, mas há um porém. Deitado em cima dele está Smaug, o Dourado, um dragão malicioso que... bem, você terá que ler para descobrir.\n Lançado em 1937, O Hobbit é um divisor de águas na literatura de fantasia mundial. Mais de 80 anos após a sua publicação, o livro que antecede os ocorridos em O Senhor dos Anéis continua arrebatando fãs de todas as idades, talvez pelo seu tom brincalhão com uma pitada de magia élfica, ou talvez porque J.R.R. Tolkien tenha escrito o melhor livro infantojuvenil de todos os tempos.",
    startReading: DateFormat("dd/MM/yyyy").format(DateTime.now()),
    status: "reading",
    progress: 168,
    tags: "Romance-Fantasia-Épico-Medieval",
    type: "físico",
    language: "Português",
    editionPublicationDate: "15/07/2019");

Book livroLido = Book(
  author: "Mary Shelley",
  id: 2,
  image:
      "https://cdn.awsli.com.br/2500x2500/2419/2419289/produto/2028017040d36207bbb.jpg",
  title: "Frankenstein",
  pages: 240,
  chapters: 24,
  isbn10: 8594318111,
  isbn13: 9788594318114,
  publisher: "Principis",
  publicationDate: "01/01/1818",
  synopsis: "Aquele que é todo monstrão sabe",
  startReading: DateFormat("dd/MM/yyyy").format(DateTime.now()),
  status: "toRead",
  progress: 0,
  tags: "Romance",
);

Book emptyBook = Book(id: -1, title: "", author: "", pages: -1);
