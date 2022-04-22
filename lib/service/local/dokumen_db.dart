import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DokumenDb {
  late Database db;

  Future open() async {
    var databasesPath = await  getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    print(path);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {

          await db.execute('''

                    CREATE TABLE IF NOT EXISTS dokumenPage( 
                          id integer not null primary key autoincrement,
                          dokumen varchar(255) not null,
                          nomor int not null,
                      );

                      //create more table here
                  
                  ''');
          print("Table Created");
        });
  }

  Future<Map<dynamic, dynamic>?> getStudentById(int id) async {
    List<Map> maps = await db.query('dokumen',
        where: 'id = ?',
        whereArgs: [id]
    );
    if (maps.length > 0) {
      return maps.first;
    }
    return null;
  }
}