import 'package:adv_flutter_lab/Lab9/student_uni_crud/db_service.dart';
import 'package:adv_flutter_lab/Lab9/student_uni_crud/string_constants.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase implements DatabaseService{
  MyDatabase._();

  static final MyDatabase _instance = MyDatabase._();

  factory MyDatabase(){
    return _instance;
  }

  Database? _database;

  Future<Database> get database async{
    _database ??= await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async{
    final path = "${await getDatabasesPath()}/$DB_NAME";

    return await openDatabase(
      path,
      version: 1,
        onCreate: (db , version) async{
        await db.execute('PRAGMA foreign_keys = ON');

        await db.execute(
          '''
          CREATE TABLE $TBL_UNIVERSITY(
            $COL_UNI_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $COL_UNI_NAME TEXT
          )
          '''
        );

        await db.execute(
            '''
              CREATE TABLE $TBL_STUDENT(
              $COL_STUDENT_ID INTEGER PRIMARY KEY AUTOINCREMENT,
              $COL_STUDENT_NAME TEXT,
              $COL_STUDENT_ENROLLMENT TEXT,
              $COL_GRADE12 TEXT,
              $COL_CGPA TEXT,
              $COL_UNIVERSITY_ID INT,
              FOREIGN KEY($COL_UNIVERSITY_ID) REFERENCES $TBL_UNIVERSITY($COL_UNI_ID)
              )
            '''
        );
    }
    );
  }

}