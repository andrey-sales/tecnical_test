

import 'package:dio/dio.dart';
import 'package:ecommerce/modules/home/domain/mappers/router_mapper.dart';
import 'package:ecommerce/modules/home/favorites/presentation/favorite_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'home/home_module.dart';

class AppModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(() => Dio());
    i.addSingleton(() => FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true)));
  }

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: HomeModule());
    r.child(RouterMapper.favorites, child: (context) => FavoritePage(favorites: r.args.data));
  }
}