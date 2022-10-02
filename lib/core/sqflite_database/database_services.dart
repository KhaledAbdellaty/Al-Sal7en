import 'package:sqflite/sqflite.dart';

abstract class DatabaseServices {
  Future<Database> initDatabase();
  Future<void> createDatabase(Database database, int version);
  Future<void> addToBookMark(Map<String, dynamic> data);
  Future<void> removefromBookMark(String ayahText);
  Future<List<dynamic>> getAllBookMarks();
}
