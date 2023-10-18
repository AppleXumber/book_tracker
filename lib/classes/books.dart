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

Book emptyBook = Book(id: -1, title: "", author: "", pages: -1);
