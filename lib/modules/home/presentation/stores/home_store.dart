

import 'dart:async';

import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/usecases/get_favorites_usecase.dart';
import 'package:ecommerce/modules/home/domain/usecases/get_filtered_products_usecase.dart';
import 'package:ecommerce/modules/home/domain/usecases/get_products_usecase.dart';
import 'package:ecommerce/modules/home/domain/usecases/remove_favorite_usecase.dart';
import 'package:ecommerce/modules/home/domain/usecases/save_favorite_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store  {

  final _getProductsUseCase = Modular.get<GetProductsUseCase>();
  final _getFilteredProductsUseCase = Modular.get<GetFilteredProductsUseCase>();
  final _getFavoritesUseCase = Modular.get<GetFavoritesUseCase>();
  final _saveFavoritesUseCase = Modular.get<SaveFavoritesUseCase>();
  final _removeFavoritesUseCase = Modular.get<RemoveFavoritesUseCase>();

  @observable
  Timer? debounce;

  @observable
  String filter = "";

  @observable
  String errorMessage = "";

  @action
  setErrorMessage(String value) => errorMessage = value;

  @action
  setFilter(String value) {
    filter = value;

    if (debounce?.isActive ?? false) debounce?.cancel();

      debounce = Timer(const Duration(milliseconds: 500), () async {

        try {

          setLoading(true);
          setErrorMessage("");

          List<ProductEntity> result = await _getFilteredProductsUseCase.call(
              value: value);

          productsSearching = result.asObservable();

        } catch(e) { setErrorMessage(e.toString()); } finally { setLoading(false); }

      });
  }

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @observable
  ObservableList<ProductEntity> products = <ProductEntity>[].asObservable();

  @observable
  ObservableList<ProductEntity> productsSearching = <ProductEntity>[].asObservable();

  @computed
  List<ProductEntity> get productsFiltered {

    if(filter.isEmpty) { return products; }

    if(filter.isNotEmpty && productsSearching.isNotEmpty) {
      return productsSearching.where((e) => e.title.toLowerCase().contains(filter.toLowerCase())).toList();
    }

    else { return products.where((e) => e.title.toLowerCase().contains(filter.toLowerCase())).toList(); }

  }

  @observable
  ObservableList<ProductEntity> favorites = <ProductEntity>[].asObservable();

  @action
  addFavorite({required ProductEntity value}) async {

    favorites.add(value);

    _saveFavoritesUseCase.call(product: value);

  }

  @action
  removeFavorite({required ProductEntity value}) async {

    favorites.remove(value);

    _removeFavoritesUseCase.call(product: value);

  }

  @action
  init() async {

    try {

      setLoading(true);

      List<ProductEntity> listProducts = await _getProductsUseCase.call();

      products = listProducts.asObservable();

    } catch(e) { setErrorMessage(e.toString()); } finally { setLoading(false); }


    List<ProductEntity> listFavorites = await _getFavoritesUseCase.call();

    favorites = listFavorites.asObservable();


  }


}