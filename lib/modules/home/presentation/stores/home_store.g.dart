// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<List<ProductEntity>>? _$productsFilteredComputed;

  @override
  List<ProductEntity> get productsFiltered => (_$productsFilteredComputed ??=
          Computed<List<ProductEntity>>(() => super.productsFiltered,
              name: 'HomeStoreBase.productsFiltered'))
      .value;

  late final _$debounceAtom =
      Atom(name: 'HomeStoreBase.debounce', context: context);

  @override
  Timer? get debounce {
    _$debounceAtom.reportRead();
    return super.debounce;
  }

  @override
  set debounce(Timer? value) {
    _$debounceAtom.reportWrite(value, super.debounce, () {
      super.debounce = value;
    });
  }

  late final _$filterAtom =
      Atom(name: 'HomeStoreBase.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'HomeStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'HomeStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$productsAtom =
      Atom(name: 'HomeStoreBase.products', context: context);

  @override
  ObservableList<ProductEntity> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductEntity> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$productsSearchingAtom =
      Atom(name: 'HomeStoreBase.productsSearching', context: context);

  @override
  ObservableList<ProductEntity> get productsSearching {
    _$productsSearchingAtom.reportRead();
    return super.productsSearching;
  }

  @override
  set productsSearching(ObservableList<ProductEntity> value) {
    _$productsSearchingAtom.reportWrite(value, super.productsSearching, () {
      super.productsSearching = value;
    });
  }

  late final _$favoritesAtom =
      Atom(name: 'HomeStoreBase.favorites', context: context);

  @override
  ObservableList<ProductEntity> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<ProductEntity> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$addFavoriteAsyncAction =
      AsyncAction('HomeStoreBase.addFavorite', context: context);

  @override
  Future addFavorite({required ProductEntity value}) {
    return _$addFavoriteAsyncAction.run(() => super.addFavorite(value: value));
  }

  late final _$removeFavoriteAsyncAction =
      AsyncAction('HomeStoreBase.removeFavorite', context: context);

  @override
  Future removeFavorite({required ProductEntity value}) {
    return _$removeFavoriteAsyncAction
        .run(() => super.removeFavorite(value: value));
  }

  late final _$initAsyncAction =
      AsyncAction('HomeStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  dynamic setErrorMessage(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setErrorMessage');
    try {
      return super.setErrorMessage(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
debounce: ${debounce},
filter: ${filter},
errorMessage: ${errorMessage},
loading: ${loading},
products: ${products},
productsSearching: ${productsSearching},
favorites: ${favorites},
productsFiltered: ${productsFiltered}
    ''';
  }
}
