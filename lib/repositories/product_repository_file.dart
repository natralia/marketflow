import 'dart:convert';
import 'dart:io';
import 'package:marketflow/models/product.dart';
import 'package:marketflow/repositories/product_repository.dart';
import 'package:path_provider/path_provider.dart';

class ProductRepositoryFile implements ProductRepository {
  late File _file;
  List<Product> _products = [];

  ProductRepositoryFile() {
    _loadFile();
  }

  void _loadFile() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appPath = appDocumentsDirectory.path;
    _file = File("$appPath/database.json");
    print("Only");
    if (!_file.existsSync()) {
      _file.createSync();
      _file.writeAsStringSync(jsonEncode([]));
    }
    String fileRaw = _file.readAsStringSync();
    List listRaw = jsonDecode(fileRaw);
    _products = listRaw.map<Product>((map) => Product.fromMap(map)).toList();
  }

  @override
  void save(Product product) {
    _products.add(product);
    _updateFile();
  }

  @override
  Product findOne(int index) {
    return _products.elementAt(index);
  }

  @override
  List<Product> findAll() {
    return _products;
  }

  @override
  void update(int index, Product newProduct) {
    _products[index] = newProduct;
    _updateFile();
  }

  @override
  void remove(int index) {
    _products.removeAt(index);
    _updateFile();
  }

  void _updateFile() {
    List<Map<String, dynamic>> productsMaps = _products
        .map<Map<String, dynamic>>((product) => product.toMap())
        .toList();

    String productsJson = jsonEncode(productsMaps);
    _file.writeAsStringSync(productsJson);
  }
}
