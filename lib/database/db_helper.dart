import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task.dart';
import '../models/expense.dart';

class DBHelper {
  static Database? _db;

  static const String tableTask = "tasks";
  static const String columnId = "id";
  static const String columnTitle = "title";
  static const String columnIsDone = "isDone";
  // Expense table
  static const String tableExpense = "expenses";
  static const String columnExpenseId = "id";
  static const String columnExpenseTitle = "title";
  static const String columnExpenseAmount = "amount";
  static const String columnExpenseDate = "date";

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, "app.db");

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableTask (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTitle TEXT,
            $columnIsDone INTEGER
          )
        ''');
        await db.execute('''
          CREATE TABLE $tableExpense (
            $columnExpenseId TEXT PRIMARY KEY,
            $columnExpenseTitle TEXT,
            $columnExpenseAmount REAL,
            $columnExpenseDate INTEGER
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('''
            CREATE TABLE $tableExpense (
              $columnExpenseId TEXT PRIMARY KEY,
              $columnExpenseTitle TEXT,
              $columnExpenseAmount REAL,
              $columnExpenseDate INTEGER
            )
          ''');
        }
      },
    );
  }

  // Expense CRUD
  static Future<int> insertExpense(Expense expense) async {
    final db = await database;
    return await db.insert(tableExpense, {
      columnExpenseId: expense.id,
      columnExpenseTitle: expense.title,
      columnExpenseAmount: expense.amount,
      columnExpenseDate: expense.date.millisecondsSinceEpoch,
    });
  }

  static Future<List<Expense>> getExpenses() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableExpense);
    return List.generate(maps.length, (i) {
      final m = maps[i];
      return Expense(
        id: m[columnExpenseId],
        title: m[columnExpenseTitle],
        amount: (m[columnExpenseAmount] as num).toDouble(),
        date: DateTime.fromMillisecondsSinceEpoch(m[columnExpenseDate]),
      );
    });
  }

  static Future<int> deleteExpense(String id) async {
    final db = await database;
    return await db.delete(
      tableExpense,
      where: "$columnExpenseId = ?",
      whereArgs: [id],
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
    return await db.delete(tableTask, where: "$columnId = ?", whereArgs: [id]);
  }
}
