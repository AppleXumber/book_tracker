import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../classes/books.dart';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(tableSQL);
  }


  static const String tableSQL = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
      '$_title TEXT,'
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
      '$_language TEXT,'
      '$_isbn10 INTEGER,'
      '$_isbn13 INTEGER,'
      '$_tags TEXT,'
      '$_type TEXT,'
      '$_howToRead TEXT,'
      '$_goal TEXT,'
      '$_status TEXT,'
      'createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP'
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
  static const String _language = "language";
  static const String _publicationDate = "publicationDate";
  static const String _editionPublicationDate = "editionPublicationDate";
  static const String _isbn10 = "isbn10";
  static const String _isbn13 = "isbn13";
  static const String _tags = "tags";
  static const String _type = "type";
  static const String _howToRead = "howToRead";
  static const String _goal = "goal";
  static const String _status = "status";

// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<void> addColumn(String name, String type) async {
    final db = await SQLHelper.db();
    type.toUpperCase();
    var count = await db.execute("ALTER TABLE $_tableName ADD COLUMN $name $type");
    return count;

  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dbBooks.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(Book book) async {
    final db = await SQLHelper.db();
    final data = toMap(book);
    final id = await db.insert('$_tableName', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('$_tableName', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('$_tableName', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(int id, Book book) async {
    final db = await SQLHelper.db();
    final data = toMap(book);

    final result =
        await db.update('$_tableName', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("$_tableName", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static Map<String, dynamic> toMap(Book book) {
    print("Convertendo book em map");
    final Map<String, dynamic> booksMap = Map();
    booksMap[_title] = book.title;
    booksMap[_image] = book.image;
    booksMap[_author] = book.author;
    booksMap[_progress] = book.progress;
    booksMap[_pages] = book.pages;
    booksMap[_chapters] = book.chapters;
    booksMap[_startReading] = book.startReading;
    booksMap[_endReading] = book.endReading;
    booksMap[_synopsis] = book.synopsis;
    booksMap[_publisher] = book.publisher;
    booksMap[_language] = book.language;
    booksMap[_publicationDate] = book.publicationDate;
    booksMap[_editionPublicationDate] = book.editionPublicationDate;
    booksMap[_tags] = book.tags;
    booksMap[_isbn10] = book.isbn10;
    booksMap[_isbn13] = book.isbn13;
    booksMap[_type] = book.type;
    booksMap[_howToRead] = book.howToRead;
    booksMap[_goal] = book.goal;

    print("Mapa de tarefas: $booksMap");
    return booksMap;
  }
}
