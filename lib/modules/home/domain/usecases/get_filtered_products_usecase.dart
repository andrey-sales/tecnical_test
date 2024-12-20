

import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/repositories/product_repository_interface.dart';

class GetFilteredProductsUseCase {

  final IProductRepository repository;

  GetFilteredProductsUseCase({required this.repository});

  Future<List<ProductEntity>> call({required String value}) async => await repository.getProducts();

}