import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task.dart';

class DBHelper {
  static Database? _db;

  static const String tableTask = "tasks";
  static const String columnId = "id";
  static const String columnTitle = "title";
  static const String columnIsDone = "isDone";

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, "todo.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableTask (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTitle TEXT,
            $columnIsDone INTEGER
          )
        ''');
      },
    );
  }

  static Future<int> insertTask(Task task) async {
    final db = await database;
    return await db.insert(tableTask, task.toMap());
  }

  static Future<List<Task>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableTask);
    return List.generate(maps.length, (i) => Task.fromMap(maps[i]));
  }

  static Future<int> updateTask(Task task) async {
    final db = await database;
    return await db.update(
      tableTask,
      task.toMap(),
      where: "$columnId = ?",
      whereArgs: [task.id],
    );
  }

  static Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete(
      tableTask,
      where: "$columnId = ?",
      whereArgs: [id],
    );
  }
}
