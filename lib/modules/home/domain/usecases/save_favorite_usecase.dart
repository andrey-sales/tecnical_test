



import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/repositories/product_repository_interface.dart';

class SaveFavoritesUseCase {

  final IProductRepository repository;

  SaveFavoritesUseCase({required this.repository});

  Future<void> call({required ProductEntity product}) async =>
      await repository.saveFavorite(product: product);

}