import 'package:book_tracker/database/database.dart';
import 'package:sqflite/sqflite.dart';
import '../classes/books.dart';

class BookDao {
  static const String tableSQL = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_title TEXT, '
      '$_author TEXT,'
      '$_image TEXT,'
      '$_progress REAL,'
      '$_pages INTEGER,'
      '$_chapters INTEGER,'
      '$_startReading TEXT,'
      '$_endReading TEXT,'
      '$_synopsis TEXT,'
      '$_publisher TEXT,'
      '$_publicationDate TEXT,'
      '$_editionPublicationDate TEXT,'
      '$_isbn10 INTEGER,'
      '$_isbn13 INTEGER,'
      '$_type TEXT,'
      '$_howToRead TEXT,'
      '$_goal TEXT,'
      '$_status TEXT,'
      ')';

  static const String _tableName = "booksTable";
  static const String _title = "title";
  static const String _image = "image";
  static const String _id = "id";
  static const String _author = "author";
  static const String _progress = "progress";
  static const String _pages = "pages";
  static const String _chapters = "chapters";
  static const String _startReading = "startReading";
  static const String _endReading = "endReading";
  static const String _synopsis = "synopsis";
  static const String _publisher = "publisher";
  static const String _publicationDate = "publicationDate";
  static const String _editionPublicationDate = "editonPublicationDate";
  static const String _isbn10 = "isbn10";
  static const String _isbn13 = "isbn13";
  static const String _type = "type";
  static const String _howToRead = "howToRead";
  static const String _goal = "goal";
  static const String _status = "status";

  /*saave(Book tarefa) async {
    print("Iniciando o save: ");
    final Database db = await getDatabase();
    var itemExiste = await find(tarefa.nome);
    Map<String, d,0ynamic> taskMap = toMap(tarefa);

    if (itemExiste.isEmpty) {
      print('A tarefa não existia.');
      await db.insert(_tableName, taskMap);
      return true;
    } else {
      print("A tarefa já existia!");
      await db.update(_tableName, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nome]);
      return false;
    }
  }*/

  save(Book book) async {
    print("Iniciando o save: ");
    final Database db = await getDatabase();

    Map<String, dynamic> bookMap = toMap(book);

    await db.update(_tableName, bookMap);
    return true;
  }

  Map<String, dynamic> toMap(Book book) {
    print("Convertendo book em map");
    final Map<String, dynamic> booksMap = Map();
    booksMap[_title] = book.title;
    booksMap[_image] = book.image;
    booksMap[_id] = book.id;
    booksMap[_author] = book.author;
    booksMap[_progress] = book.progress;
    booksMap[_pages] = book.pages;
    booksMap[_chapters] = book.chapters;
    booksMap[_startReading] = book.startReading;
    booksMap[_endReading] = book.endReading;
    booksMap[_synopsis] = book.synopsis;
    booksMap[_publisher] = book.publisher;
    booksMap[_publicationDate] = book.publicationDate;
    booksMap[_editionPublicationDate] = book.editionPublicationDate;
    booksMap[_isbn10] = book.isbn10;
    booksMap[_isbn13] = book.isbn13;
    booksMap[_type] = book.type;
    booksMap[_howToRead] = book.howToRead;
    booksMap[_goal] = book.goal;

    print("Mapa de tarefas: $booksMap");
    return booksMap;
  }

  Future<List<Book>> findAll() async {
    print("Acessando o findALL: ");
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    print("Procurando dados no banco de dados... encontrado: $result");
    return toList(result);
  }

  List<Book> toList(List<Map<String, dynamic>> listaDeTarefas) {
    print("Convertendo to List: ");
    final List<Book> tarefas = [];

    for (Map<String, dynamic> line in listaDeTarefas) {
      final Book tarefa = Book(
          id: line[_id],
          title: line[_title],
          author: line[_author],
          pages: line[_pages]);
      tarefas.add(tarefa);
    }
    print("Lista de tarefas $tarefas");

    return tarefas;
  }

  Future<List<Book>> find(String bookTitle) async {
    print('Acessando o find: ');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: '$_title = ?',
      whereArgs: [bookTitle],
    );
    print("Tarefa encontrada: ${toList(result)}");
    return toList(result);
  }

  delete(String id) async {
    print("Deletando tarefa: $id");
    final Database db = await getDatabase();
    return db
        .delete(_tableName, where: '$_id = ?', whereArgs: [id]);
  }
}
