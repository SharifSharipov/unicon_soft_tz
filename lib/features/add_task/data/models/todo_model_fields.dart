sealed class TodoModelSQL {
  TodoModelSQL._();
  static const tableName = 'todo_table';
  static const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const intType = 'INTEGER DEFAULT 0';
  static const textType = 'TEXT NOT NULL';
  static const String id = 'id';
  static const String title = 'title';
  static const String description = 'description';
  static const String startTime = 'start_time';
  static const String isCompleted = 'is_completed';
}