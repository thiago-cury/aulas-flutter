import 'package:exemplo_sqflite/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ContactHelper {

  //Nome da tabela e das colunas
  final String contactTable = "contact_table";
  final String idColumn = "id_column";
  final String nameColumn = "name_column";
  final String emailColumn = "email_column";
  final String phoneColumn = "phone_column";

  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _db;

  initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "contacts.db"); //nome do banco de dados.

    return openDatabase(path, version: 1,
    onCreate: (Database db, int newerVersion) async {
      await db.execute(
        "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT)"
      );
    });

  }

  //Pattern - Singleton
  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }

  Future<Contact> save(Contact contact) async {
    Database dbContact = await db;
    contact.id = await dbContact.insert(contactTable, contact.toMap());
  }

  Future<List<Contact>> fetchAll() async {
    Database dbContact = await db;
    List listMap = await dbContact.query(
        contactTable,
        columns: [idColumn, nameColumn, phoneColumn, emailColumn]
    );

    List<Contact> listContact = [];

    for(Map map in listMap) {
      listContact.add(Contact.fromMap(map));
    }

    if(listContact.isNotEmpty)
      return listContact;
    else
      return null;
  }

  Future<Contact> findById(int id) async {
    Database dbContact = await db;
    List<Map> maps = await dbContact.query(
        contactTable,
        columns: [idColumn, nameColumn, phoneColumn, emailColumn],
        where: "$idColumn = ?",
        whereArgs: [id]
    );

    if(maps.length > 0)
      return Contact.fromMap(maps.first);
    else
      return null;
  }

  Future<int> delete(int id) async {
    Database dbContact = await db;
    return await dbContact.delete(
        contactTable,
        where: "$idColumn = ?",
        whereArgs: [id]
    );
  }

  Future<int> update(Contact contact) async {
    Database dbContact = await db;
    return await dbContact.update(
        contactTable,
        contact.toMap(),
        where: "$idColumn = ?",
        whereArgs: [contact.id]
    );
  }

  //Retorna a quantidade de contatos.
  Future<int> getSize() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(await dbContact.rawQuery("select count(*) from $contactTable"));
  }

}