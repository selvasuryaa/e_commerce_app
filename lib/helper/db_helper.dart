// import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/models/product.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';
import '../models/product.dart';

class DBHelper {
  Database? _database;
  // static Future<Database> dataBase() async {
  //   final dbPath = await sql.getDatabasesPath();
  //   return sql.openDatabase(path.join(dbPath, 'products.db'),
  //       onCreate: (db, version) {
  //     return db.execute('''
  //         'CREATE TABLE userproducts(id INTEGER PRIMARY KEY, title TEXT, price TEXT)''');
  //   }, version: 1);
  // }
  Future<Database> get database async {
    final dbPath = await sql.getDatabasesPath();
    const dbname = 'products.db';
    final actualdbpath = path.join(dbPath, dbname);

    _database = await sql.openDatabase(actualdbpath, version: 2, onCreate: _createDB);

    return _database!;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE userProducts(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, price num)''');
  }

  Future<void> insertProduct(Product product) async {
//     // try{
    final db = await database;
    await db.insert(
      'userProducts',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

   Future<void> updateProduct(Product product) async {
//     // try{
    final db = await database;
    await db.update(
      'userProducts',
      product.toMap(),
      where: 'id == ?',
      whereArgs: [product.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
//     print('success');
//     // }
//     // catch (err){
//     //   print(err);
//     // }
//   }

  Future<List<Product>> getProducts() async {
    // try {
    final db = await database;
    print('suces');
    List<Map<String, dynamic>> items = await db.query('userProducts');
    return List.generate(
      items.length,
      (i) => Product(
        id: items[i]['id'],
        title: items[i]['title'],
        price: items[i]['price'],
      ),
    );
  }

  Future<void> deleteProduct(Product product) async {
    final db = await database;
    await db.delete('userProducts', where: 'id == ?', whereArgs: [product.id]);
  }
}

//   Future<void> 

//  static Future<void> insertProduct(Product product) async {
//     // try{
//     final db = await DBHelper.dataBase();
//     await db.insert(
//       'user',
//       product.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     print('success');
//     // }
//     // catch (err){
//     //   print(err);
//     // }
//   }

//   static Future<List<Product>> getProducts() async {
//     try {
//       final db = await DBHelper.dataBase();
//       print('suces');
//       List<Map<String, dynamic>> items = await db.query('userproducts');
//       return List.generate(
//         items.length,
//         (i) => Product(
//           title: items[i]['title'],
//           price: items[i]['price'],
//         ),
//       );
//     } catch (err) {
//       print('Error$err');
//       throw err;
//     }
//   }

//   static Future<void> deleteProduct(Product product) async {
//     final db = await DBHelper.dataBase();
//     await db.delete('userproducts', where: 'id == ?', whereArgs: [product.id]);
//   }
// }
