

import 'dart:convert';

import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/mappers/local_storage_mapper.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProductLocalDataSource {

  final FlutterSecureStorage storage = Modular.get<FlutterSecureStorage>();

  Future<void> saveFavorite({required ProductEntity product}) async {

      String? value = await storage.read(key: LocalStorageMapper.favorites);

      if (value != null) {

        List<dynamic> result = jsonDecode(value);

        result.add(product.toMap());

        await storage.write(
            key: LocalStorageMapper.favorites, value: jsonEncode(result));
      } else {
        await storage.write(
            key: LocalStorageMapper.favorites, value: jsonEncode([product.toMap()]));
      }
  }

  Future<void> removeFavorite({required ProductEntity product}) async {

    String? value = await storage.read(key: LocalStorageMapper.favorites);

    if (value != null) {
      List<dynamic> result = jsonDecode(value);

      result.removeWhere((e) => e["id"] == product.id);

      storage.write(key: LocalStorageMapper.favorites, value: jsonEncode(result));
    }
  }

  Future<List<ProductEntity>> getFavorites() async {

    String? value = await storage.read(key: LocalStorageMapper.favorites);

    if(value == null) { return []; }
    else {

      List<dynamic> list = jsonDecode(value);

      return list.map((e) => ProductEntity.fromMap(e)).toList();
    }
  }

}