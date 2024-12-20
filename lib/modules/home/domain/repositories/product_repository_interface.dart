


import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';

abstract interface class IProductRepository {

  Future<List<ProductEntity>> getProducts();
  Future<List<ProductEntity>> getFilteredProducts({required String value});
  Future<List<ProductEntity>> getFavorites();
  Future<void> saveFavorite({required ProductEntity product});
  Future<void> removeFavorite({required ProductEntity product});

}