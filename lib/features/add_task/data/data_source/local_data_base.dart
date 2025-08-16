import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model.dart';
import 'package:unicon_soft_tz/features/add_task/data/models/todo_model_fields.dart';

class LocalDataBase {
  LocalDataBase._();
  static final LocalDataBase instance = LocalDataBase._();
  factory LocalDataBase() => instance;

  static Database? _dataBase;
  Future<void> warmUp() async {
    await _init();
  }

  Future<Database> _init() async {
    if (_dataBase != null) return _dataBase!;
    return _dataBase = await _initDB('todo.db');
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database database, int version) async {
    await database.execute('''
    CREATE TABLE ${TodoModelSQL.tableName} (
      ${TodoModelSQL.id} ${TodoModelSQL.idType},
      ${TodoModelSQL.title} ${TodoModelSQL.textType},
      ${TodoModelSQL.description} ${TodoModelSQL.textType},
      ${TodoModelSQL.startTime} ${TodoModelSQL.textType},
      ${TodoModelSQL.isCompleted} ${TodoModelSQL.intType}
    ) ''');
  }

  Future<int> insertTodo(TodoModel todoModel) async {
    final db = await instance._init();
    return await db.insert(TodoModelSQL.tableName, todoModel.toJson());
  }

  Future<List<TodoModel>> getTodos() async {
    final db = await instance._init();
    final todos = await db.query(TodoModelSQL.tableName);
    return todos.map((e) => TodoModel.fromJson(e)).toList();
  }

  Future<int> deleteById(int id) async {
    final db = await instance._init();
    return await db.delete(
      TodoModelSQL.tableName,
      where: '_id = ?',
      whereArgs: [id],
    );
  }

  Future<int> edit({required int id, required TodoModel todoModel}) async {
    final db = await instance._init();
    return await db.update(
      TodoModelSQL.tableName,
      todoModel.toJson(),
      where: '_id = ?',
      whereArgs: [id],
    );
  }

  Future<void> close() async {
    final db = _dataBase;
    if (db != null && db.isOpen) {
      await db.close();
      _dataBase = null;
    }
  }
}
