import 'dart:async';
import 'dart:io';
import 'package:Lineup11/model/Person.dart';
import 'package:Lineup11/utils/Constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PersonDatabase {
  static final PersonDatabase _personDatabase = new PersonDatabase._internal();

  final String tableName = "Persons";

  Database db;

  bool didInit = false;

  List<Person> main;
  List<Person> sub;
  Person manager;

  static PersonDatabase get() {
    return _personDatabase;
  }

  PersonDatabase._internal();

  // Use this method to access the database, because initialization of the database
  Future<Database> _getDb() async{
    if(!didInit) await _init();
    return db;
  }

  Future init() async {
    return await _init();
  }

  Future _init() async {
    // Get a location using path_provider
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "lineup.db");

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              "CREATE TABLE $tableName ("
                  "${Person.db_id} INTEGER PRIMARY KEY,"
                  "${Person.db_role} TEXT,"
                  "${Person.db_number} INTEGER,"
                  "${Person.db_name} TEXT,"
                  "${Person.db_image} BLOB,"
                  "${Person.db_x} REAL,"
                  "${Person.db_y} REAL"
                  ")");
        });
    didInit = true;
  }

  Future close() async {
    var db = await _getDb();
    return db.close();
  }

  void initTeams(List<Person> list) {
    main = new List(11);
    sub = new List(11);
    manager = new Person();

    list.forEach((person){
      if (person.role == Constants.manager) {
        manager = person;
      } else if (person.role == Constants.main) {
        main[person.id] = person;
      } else if (person.role == Constants.sub) {
        sub[person.id-11] = person;
      }
    });
  }

  Person getPersonById(int id) {
    if (id == 22) {
      return manager;
    }

    return id < 11? main[id] : sub[id - 11];
  }

  // get all records
  Future<List<Person>> getPersonsFromDatabase() async{
    var db = await _getDb();
    var result = await db.rawQuery('SELECT * FROM $tableName');

    if(result.length == 0){
      return [];
    }

    List<Person> persons = [];

    for(Map<String,dynamic> map in result) {
      persons.add(new Person.fromMap(map));
    }

    return persons;
  }

  // Inserts or replaces the book.
  Future updatePersonInDatabase(Person person) async {
    var db = await _getDb();
    await db.rawInsert(
        'INSERT OR REPLACE INTO '
            '$tableName(${Person.db_id}, ${Person.db_role}, ${Person.db_number}, ${Person.db_name}, ${Person.db_image}, ${Person.db_x}, ${Person.db_y})'
            ' VALUES(?, ?, ?, ?, ?, ?, ?)',
        [person.id, person.role, person.number, person.name, person.image, person.x, person.y]);

    // update records in array as well
    if (person.id <= 10) {
      main[person.id] = person;
    } else if (person.id > 10 && person.id <= 21) {
      sub[person.id - 11] = person;
    } else {
      manager = person;
    }
  }

  Future deleteRecords() async {
    var db = await _getDb();
    await db.rawDelete('DELETE FROM $tableName');
//    await db.rawDelete('DROP TABLE $tableName');
  }
}