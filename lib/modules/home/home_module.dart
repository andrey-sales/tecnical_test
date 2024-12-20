

import 'dart:ui';

import 'package:ecommerce/modules/home/details/presentation/product_details_page.dart';
import 'package:ecommerce/modules/home/domain/mappers/router_mapper.dart';
import 'package:ecommerce/modules/home/domain/usecases/get_favorites_usecase.dart';
import 'package:ecommerce/modules/home/domain/usecases/get_filtered_products_usecase.dart';
import 'package:ecommerce/modules/home/domain/usecases/get_products_usecase.dart';
import 'package:ecommerce/modules/home/domain/usecases/remove_favorite_usecase.dart';
import 'package:ecommerce/modules/home/domain/usecases/save_favorite_usecase.dart';
import 'package:ecommerce/modules/home/external/local/product_local_datasource.dart';
import 'package:ecommerce/modules/home/external/remote/product_remote_datasource.dart';
import 'package:ecommerce/modules/home/home_page.dart';
import 'package:ecommerce/modules/home/infra/repositories/product_repository.dart';
import 'package:ecommerce/modules/home/presentation/stores/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {

  @override
  void binds(i) {

    i.add(() => HomeStore());
    i.add(() => ProductRemoteDataSource());
    i.add(() => ProductLocalDataSource());

    i.add(() => ProductRepository(i.get<ProductRemoteDataSource>(), i.get<ProductLocalDataSource>()));


    i.add(() => GetProductsUseCase(repository: i.get<ProductRepository>()));
    i.add(() => GetFilteredProductsUseCase(repository: i.get<ProductRepository>()));
    i.add(() => GetFavoritesUseCase(repository: i.get<ProductRepository>()));
    i.add(() => SaveFavoritesUseCase(repository: i.get<ProductRepository>()));
    i.add(() => RemoveFavoritesUseCase(repository: i.get<ProductRepository>()));

  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => HomePage());
    r.child(RouterMapper.details, child: (context) => ProductDetailsPage(store: r.args.data[0], product: r.args.data[1]));
  }
}