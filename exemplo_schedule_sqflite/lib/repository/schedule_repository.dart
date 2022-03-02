import 'package:exemplo_sqflite/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ScheduleRepository { //CRUD - Create Read Update Delete

  final String scheduleTable = "schedule_table";

  final String idColumn = "id_column";
  final String nameColumn = "name_column";
  final String phoneColumn = "phone_column";
  final String dateColumn = "date_column";
  final String hourColumn = "hour_column";
  final String kindOfServiceColumn = "kind_of_service_column";

  //criar o banco.
  //conexão com o banco.
  Future<Database> initializeDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "schedules.db"); //nome do banco de dados.

    return openDatabase(path, version: 1,
        onCreate: (Database database, int newerVersion) async {
          await database.execute(
              "CREATE TABLE $scheduleTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $phoneColumn TEXT, $dateColumn TEXT, $hourColumn TEXT, $kindOfServiceColumn TEXT)"
          );
        },
    );
  }

  Future<int> save(Schedule schedule) async { //aqui nao vem id.
    final Database database = await initializeDB();
    return await database.insert(scheduleTable, schedule.toMap()); //se salvou no banco ou nao.
  }

  Future<int> saveAll(List<Schedule> schedules) async {
    int result = 0;
    final Database database = await initializeDB();
    for(var schedule in schedules) { //foreach
      result = await database.insert(scheduleTable, schedule.toMap());
    }
    return result;
  }

  Future<List<Schedule>> fetchAll() async {
    final Database database = await initializeDB();
    final List<Map<String, Object?>> query = await database.query(
        scheduleTable,
        columns: [idColumn, nameColumn, phoneColumn, dateColumn, hourColumn, kindOfServiceColumn]
    );
    return query.map((element) => Schedule.fromMap(element)).toList();
  }

  Future<Schedule?> findById(int id) async {
    final Database database = await initializeDB();
    List<Map> maps = await database.query(
        scheduleTable,
        columns: [idColumn, nameColumn, phoneColumn, dateColumn, hourColumn, kindOfServiceColumn],
        where: "$idColumn = ?", //bindValue
        whereArgs: [id]
    );

    if(maps.isNotEmpty) {
      return Schedule.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> delete(int id) async {
    final Database database = await initializeDB();
    return await database.delete(
        scheduleTable,
        where: "$idColumn = ?",
        whereArgs: [id]
    );
  }

  Future<int> update(Schedule schedule) async {
    final Database database = await initializeDB();
    return await database.update(
        scheduleTable,
        schedule.toMap(),
        where: "$idColumn = ?",
        whereArgs: [schedule.id]
    );
  }

  //Retorna a quantidade de agendamentos.
  Future<int?> getSize() async {
    final Database database = await initializeDB();
    return Sqflite.firstIntValue(await database.rawQuery("select count(*) from $scheduleTable"));
  }

}