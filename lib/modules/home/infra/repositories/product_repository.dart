


import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/repositories/product_repository_interface.dart';
import 'package:ecommerce/modules/home/external/local/product_local_datasource.dart';
import 'package:ecommerce/modules/home/external/remote/product_remote_datasource.dart';

class ProductRepository implements IProductRepository {

  final ProductRemoteDataSource _remote;
  final ProductLocalDataSource _local;

  ProductRepository(this._remote, this._local);

  @override
  Future<List<ProductEntity>> getProducts() async => await _remote.getProducts();

  @override
  Future<List<ProductEntity>> getFavorites() async => await _local.getFavorites();

  @override
  Future<void> removeFavorite({required ProductEntity product}) async => await _local.removeFavorite(product: product);

  @override
  Future<void> saveFavorite({required ProductEntity product}) async => await _local.saveFavorite(product: product);

  @override
  Future<List<ProductEntity>> getFilteredProducts({required String value}) async => await _remote.getFilteredProducts(value: value);







}