import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/response_list_dokumen.dart';
import '../model/response_list_user.dart';

class MyDb {
  late Database db;

  Future open() async {
    var databasesPath = await  getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    print(path);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {

          await db.execute('''

                    CREATE TABLE IF NOT EXISTS users( 
                          id integer not null primary key autoincrement,
                          dokumen varchar(255) not null,
                          nodokumen varchar(255) not null
                      );

                      //create more table here
                  
                  ''');

          await db.execute('''

                    CREATE TABLE IF NOT EXISTS sertifikasi( 
                          id integer not null primary key autoincrement,
                          sertifikat varchar(255) not null,
                          nosertifikat varchar(255) not null
                      );

                      //create more table here
                  
                  ''');
          print("Table Created");
        });
  }

  // Future<Map<dynamic, dynamic>?> getStudentById(int id) async {
  //   List<Map> maps = await db.query('users',
  //       where: 'id = ?',
  //       whereArgs: [id]
  //   );
  //   if (maps.length > 0) {
  //     return maps.first;
  //   }
  //   return null;
  // }

  // ------------------------ Ini untuk Dokumen ---------------------------------
  Future<List<ListDokumenModel>> getListDokumen(BuildContext context) async {
    final List<Map<String, dynamic>> data = await db!.rawQuery('SELECT * FROM users');
    print(data);
    if (data.isNotEmpty) {
      return List.generate(data.length, (i) {
        return ListDokumenModel(
          id: data[i]['id'],
          dokumen: data[i]['dokumen'],
          nodokumen: data[i]['nodokumen'],
        );
      });
    }
    return [];
  }

  addDokumen(String dokumen, String nodokumen, BuildContext context) async {
    await db!.rawInsert("INSERT INTO users (dokumen, nodokumen) VALUES (?, ?);",
        [dokumen, nodokumen]);
  }

  Future<ListDokumenModel?> getDokumenById(int id, BuildContext context) async {
    List<Map> maps = await db!.query('users',
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return ListDokumenModel(
        id: maps[0]['id'],
        dokumen: maps[0]['dokumen'],
        nodokumen: maps[0]['nodokumen'],
      );
    }
    return null;
  }

  editDokumen(int id, String dokumen, String nodokumen, BuildContext context) async {
    await db!.rawInsert("UPDATE users SET dokumen = ?, nodokumen = ? WHERE id = ?",
        [dokumen, nodokumen, id]);
  }

  deleteDokumen(int id, BuildContext context) async {
    await db!.rawDelete("DELETE FROM users WHERE id = ?", [id]);
  }

  // ------------------------ Ini untuk Sertifikat ---------------------------------
  Future<List<ListUserModel>> getListUser(BuildContext context) async {
    final List<Map<String, dynamic>> data = await db!.rawQuery('SELECT * FROM sertifikasi');
    print(data);
    if (data.isNotEmpty) {
      return List.generate(data.length, (i) {
        return ListUserModel(
          id: data[i]['id'],
          sertifikat: data[i]['sertifikat'],
          nosertifikat: data[i]['nosertifikat'],
        );
      });
    }
    return [];
  }

  addUser(String sertifikat, String nosertifikat, BuildContext context) async {
    await db!.rawInsert("INSERT INTO sertifikasi (sertifikat, nosertifikat) VALUES (?, ?);",
        [sertifikat, nosertifikat]);
  }

  Future<ListUserModel?> getUserById(int id, BuildContext context) async {
    List<Map> maps = await db!.query('sertifikasi',
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return ListUserModel(
        id: maps[0]['id'],
        sertifikat: maps[0]['sertifikat'],
        nosertifikat: maps[0]['nosertifikat'],
      );
    }
    return null;
  }

  editUser(int id, String sertifikat, String nosertifikat, BuildContext context) async {
    await db!.rawInsert("UPDATE sertifikasi SET sertifikat = ?, nosertifikat = ? WHERE id = ?",
        [sertifikat, nosertifikat, id]);
  }

  deleteUser(int id, BuildContext context) async {
    await db!.rawDelete("DELETE FROM sertifikasi WHERE id = ?", [id]);
  }

}