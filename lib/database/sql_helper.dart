import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(tableSQL);
  }

  static const String tableSQL = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY,'
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
      '$_isbn10 INTEGER,'
      '$_isbn13 INTEGER,'
      '$_type TEXT,'
      '$_howToRead TEXT,'
      '$_goal TEXT,'
      '$_status TEXT'
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
  static const String _editionPublicationDate = "editionPublicationDate";
  static const String _isbn10 = "isbn10";
  static const String _isbn13 = "isbn13";
  static const String _type = "type";
  static const String _howToRead = "howToRead";
  static const String _goal = "goal";
  static const String _status = "status";

// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dbBook.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(String title, String? descrption) async {
    final db = await SQLHelper.db();

    final data = {'title': title, 'description': descrption};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, String title, String? descrption) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': descrption,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
