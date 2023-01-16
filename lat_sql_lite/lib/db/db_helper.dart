import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  final String databaseName = "kindacode.db";
  final String tableName = "items";

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT,
    description TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  )""");
  }

  static Future<sql.Database> db() async {

    SqlHelper sqlHelper = SqlHelper();

    return sql.openDatabase(sqlHelper.databaseName, version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createItems(String title, String description) async {
    final db = await SqlHelper.db();

    final data = {'title': title, 'description': description};
    final id = await db.insert("items", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;

    print(id);
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SqlHelper.db();

    return db.query(
      'items',
      orderBy: "id",
    );
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SqlHelper.db();
    return db.query(
      'items',
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );
  }

  static Future<int> update(int id, String title, String description) async {
    final db = await SqlHelper.db();

    final data = {'title': title, 'description': description};

    final result = db.update(
      'items',
      data,
      where: "id = ?",
      whereArgs: [id],
    );

    return result;
    print(result);
  }

  static Future<void> delete(int id) async {
    final db = await SqlHelper.db();

    try {
      final result = db.delete('items', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Something wrong $e");
    }
  }
}
