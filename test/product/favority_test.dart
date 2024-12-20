

import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/mappers/local_storage_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'datasources/product_local_datasource_mock.dart';

void main() async {

  group("Favorites - scenery 4", ()  {

    SharedPreferences.setMockInitialValues({});

    test("Save Favorite Method", () async {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      ProductLocalDataSourceMock storage = ProductLocalDataSourceMock(storage: prefs);

      Map<String, dynamic> mock = {
        "id": 1,
        "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        "price": 109.95,
        "description": "Product Description",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        "rating": {"rate": 3.9, "count": 120}
      };

      ProductEntity product = ProductEntity.fromMap(mock);

      storage.saveFavorite(product: product);

      String? result = prefs.getString(LocalStorageMapper.favorites);

      return expect(result, isA<String>());
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Delete Favorite Method", () async {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      ProductLocalDataSourceMock storage = ProductLocalDataSourceMock(storage: prefs);

      Map<String, dynamic> mock = {
        "id": 1,
        "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        "price": 109.95,
        "description": "Product Description",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        "rating": {"rate": 3.9, "count": 120}
      };

      ProductEntity product = ProductEntity.fromMap(mock);

      storage.saveFavorite(product: product);

      storage.removeFavorite(product: product);

      String? result = prefs.getString(LocalStorageMapper.favorites);

      return expect(result, "[]");
    }, timeout: Timeout(Duration(minutes: 1)));

    test("Get Favorite Method", () async {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      ProductLocalDataSourceMock storage = ProductLocalDataSourceMock(storage: prefs);

      Map<String, dynamic> mock = {
        "id": 1,
        "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        "price": 109.95,
        "description": "Product Description",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        "rating": {"rate": 3.9, "count": 120}
      };

      ProductEntity product = ProductEntity.fromMap(mock);

      storage.saveFavorite(product: product);

      List<ProductEntity> result = await storage.getFavorites();

      return expect(result.length, 1);
    }, timeout: Timeout(Duration(minutes: 1)));

  });
}