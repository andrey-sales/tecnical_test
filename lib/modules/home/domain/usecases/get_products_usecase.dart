

import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/repositories/product_repository_interface.dart';

class GetProductsUseCase {

  final IProductRepository repository;

  GetProductsUseCase({required this.repository});

  Future<List<ProductEntity>> call() async => await repository.getProducts();

}