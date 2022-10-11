import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:untitled/core/sqflite_database/database_services.dart';

import '../../../../../core/strings/constat_strings.dart';



class QuranLocalDataSource implements DatabaseServices {
  QuranLocalDataSource._();
  static final QuranLocalDataSource instance = QuranLocalDataSource._();
  Database? _database;
  Future<Database>? get database async {
    if (_database != null) _database;
    _database = await initDatabase();
    return _database!;
  }

  @override
  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'SurahBookMarks');
    return await openDatabase(path, version: 1, onCreate: createDatabase);
  }

  @override
  Future<void> createDatabase(Database database, int version) async {
    await database.execute('''
     CREATE TABLE $surahTable(
   
    $numberOfSurah $intType, 
    $pageNo $intType,
    $text $textType,
    $juz $intType, 
    $hizbQuarter $intType,
    $manzil $intType)
    ''');
  }

  @override
  Future<void> addToBookMark(Map<String, dynamic> data) async {
    final db = await instance.database;
    db!.insert(
      surahTable,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> removefromBookMark(String ayahText) async {
    final db = await instance.database;
    db!.delete(
      surahTable,
      where: '$text = ?',
      whereArgs: [ayahText],
    );
  }

  @override
  Future<List> getAllBookMarks() async {
    final db = await instance.database;
    final surahs = db!.query(surahTable);
    return surahs;
  }
}
