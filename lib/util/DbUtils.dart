import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'DbBaseBean.dart';
//import 'package:yxk_app/utils/data_utils.dart';
//import 'package:yxk_app/utils/log_utils.dart';

//import 'db_bean_base.dart';

/// 数据库存储
///

class DbUtils {
  DbUtils._();

  // 数据库路径
  String databasesPath;
  // 数据库
  Database database;
  // 数据库版本
  int dbVersion = 1;

  static DbUtils dbUtils;

  static DbUtils getInstance() {
    if (null == dbUtils) dbUtils = DbUtils._();
    return dbUtils;
  }

  /// 打开数据库
  Future openDb(String dbName) async {
    // 如果数据库路径不存在，赋值
    if (null == databasesPath || databasesPath.isEmpty)
      databasesPath = await getDatabasesPath();

    // 如果数据库存在，而且数据库没有关闭，先关闭数据库
    closeDb();

    database = await openDatabase(join(databasesPath, dbName + '.db'),
        version: dbVersion, onCreate: (Database db, int version) async {
          // 用户表
          await db.execute(
              'CREATE TABLE ClothingStyle (PPHH TEXT PRIMARY KEY'+
                  ', PinPai TEXT'+
                  ', HuoHao TEXT'+
                  ', PicPath TEXT'+
                  ', Pic TEXT'+
                  ', JG1 TEXT'+
                  ', JG2 TEXT'+
                  ', State Text'+
                  ', CreateTime Text'+
                  ', UpdateTime Text'+
                  ', BY1 Text'+
                  ', BY2 Text)');
          // 收货地址信息表
//          await db.execute(
//              'CREATE TABLE PickInfo (id TEXT PRIMARY KEY, userName TEXT, tel TEXT, receiver TEXT, province TEXT, city TEXT, county TEXT, address TEXT, status TEXT)');
        },
        onUpgrade: (Database db, int oldVersion, int newVersion) async {
          // 版本更新可能牵扯到重新插入表、删除表、表中字段变更-具体更新相关sql语句进行操作
          //更新表
          await db.execute(
              'CREATE TABLE ClothingStyle (PPHH TEXT PRIMARY KEY'+
                  ', PinPai TEXT'+
                  ', HuoHao TEXT'+
                  ', PicPath TEXT'+
                  ', Pic TEXT'+
                  ', JG1 TEXT'+
                  ', JG2 TEXT'+
                  ', State Text'+
                  ', CreateTime Text'+
                  ', UpdateTime Text'+
                  ', BY1 Text'+
                  ', BY2 Text)');
        });
  }

  // 插入数据
  Future<void> insertItem<T extends DbBaseBean>(T t) async {
    if (null == database || !database.isOpen) return;

    print('插入数据ing...');
    // 插入操作
    await database.insert(
      t.getTableName(),
      t.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// 删除数据
  Future<void> deleteItem<T extends DbBaseBean>(T t,
      {String key = '', String value = ''}) async {
    if (null == database || !database.isOpen) return null;

    // 删除表
    if (key == ''|| value == '') {
      await database.delete(t.getTableName());
    } else {
      // 删除数据
      await database.delete(
        t.getTableName(),
        where: (key + " = ?"),
        whereArgs: [value],
      );
    }

    print('已清空数据');
  }

  /// 更新数据
  Future<void> updateItem<T extends DbBaseBean>(
      T t, String key, String value) async {
    if (null == database || !database.isOpen) return null;

    // 更新数据
    await database.update(
      t.getTableName(),
      t.toJson(),
      where: (key + " = ?"),
      whereArgs: [value],
    );
  }

  // 查询数据
  Future<List<T>> queryItems<T extends DbBaseBean>(T t,
      {String key = "", String value = ""}) async {
    if (null == database || !database.isOpen) return null;

    List<Map<String, dynamic>> maps = List();

    print('读取数据ing...');
    // 列表数据
    if (key == "" || value == "") {
      maps = await database.query(t.getTableName());
    } else {
      maps = await database.query(
        t.getTableName(),
        where: (key + " = ?"),
        whereArgs: [value],
      );
    }

    // map转换为List集合
    return List.generate(maps.length, (i) {
      return t.fromJson(maps[i]);
    });
  }


  /// 关闭数据库
  closeDb() async {
    // 如果数据库存在，而且数据库没有关闭，先关闭数据库
    if (null != database && database.isOpen) {
      await database.close();
      database = null;
    }
  }

  /// 删除数据库
  deleteDb(String dbName) async {
    // 如果数据库路径不存在，赋值
    if (null == databasesPath || databasesPath.isEmpty)
      databasesPath = await getDatabasesPath();

    await deleteDatabase(join(databasesPath, dbName + '.db'));
  }
}