import 'dart:convert';

import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/mappers/local_storage_mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductLocalDataSourceMock {

  final SharedPreferences storage;

  ProductLocalDataSourceMock({required this.storage});

  Future<void> saveFavorite({required ProductEntity product}) async {

    String? value = storage.getString(LocalStorageMapper.favorites);

    if (value != null) {

      List<dynamic> result = jsonDecode(value);

      result.add(product.toMap());

      await storage.setString(LocalStorageMapper.favorites, jsonEncode(result));

    } else {
      await storage.setString(LocalStorageMapper.favorites, jsonEncode([product.toMap()]));
    }
  }

  Future<void> removeFavorite({required ProductEntity product}) async {

    String? value = storage.getString(LocalStorageMapper.favorites);

    if (value != null) {
      List<dynamic> result = jsonDecode(value);

      result.removeWhere((e) => e["id"] == product.id);

      storage.setString(LocalStorageMapper.favorites, jsonEncode(result));
    }
  }

  Future<List<ProductEntity>> getFavorites() async {

    String? value = storage.getString(LocalStorageMapper.favorites);

    if(value == null) { return []; }
    else {

      List<dynamic> list = jsonDecode(value);

      return list.map((e) => ProductEntity.fromMap(e)).toList();
    }
  }

}