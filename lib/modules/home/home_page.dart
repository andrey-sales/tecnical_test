import 'package:ecommerce/modules/home/domain/tags/product_page_tags.dart';
import 'package:ecommerce/modules/home/presentation/components/home_empty_products_widget.dart';
import 'package:ecommerce/modules/home/presentation/components/home_error_message_widget.dart';
import 'package:ecommerce/modules/home/presentation/components/home_header_widget.dart';
import 'package:ecommerce/modules/home/presentation/components/home_loading_widget.dart';
import 'package:ecommerce/modules/home/presentation/components/home_search_field_widget.dart';
import 'package:ecommerce/modules/home/presentation/components/product_card_widget.dart';
import 'package:ecommerce/modules/home/presentation/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeStore store = Modular.get<HomeStore>();

  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).padding.top + 10.0 : MediaQuery.of(context).padding.top + 5.0),
              HomeHeaderWidget(favorites: store.favorites, key: Key(ProductPageTAGs.header)),
              const SizedBox(height: 10.0),
              HomeSearchFieldWidget(onChanged: store.setFilter,key: Key(ProductPageTAGs.homeSearch)),
              if(store.loading && store.productsFiltered.isEmpty) Expanded(child: HomeLoadingWidget(key: Key(ProductPageTAGs.homeLoading),filter: store.filter))
              else if (store.errorMessage.isNotEmpty) Expanded(child: HomeErrorMessageWidget(title: store.errorMessage,key: Key(ProductPageTAGs.homeError),))
              else
              store.productsFiltered.isEmpty ? Expanded(key: Key(ProductPageTAGs.homeEmpty), child: HomeEmptyProductsWidget()) : Expanded(
                child: ListView.separated(
                    key: Key(ProductPageTAGs.homeList),
                    padding: EdgeInsets.zero,
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: store.productsFiltered.length,
                    itemBuilder: (context, index) =>  ProductCardWidget(
                        key: Key("${ProductPageTAGs.homeItem}_$index"),
                        store: store, product: store.productsFiltered[index])),
              )
            ]
        ),
      ),
    );
  }
}
