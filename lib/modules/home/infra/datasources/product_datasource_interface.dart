


import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';

abstract interface class IProductDataSource {


    Future<List<ProductEntity>> getProducts();
    Future<List<ProductEntity>> getFilteredProducts({required String value});

}