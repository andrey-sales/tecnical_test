

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/mappers/exception_message_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import 'datasources/product_remote_datasource_mock.dart';

void main() async {

  group("Get Products - scenery 1", ()
  {
    ProductRemoteDataSourceMock datasource = ProductRemoteDataSourceMock();

    test("Find Products", () async {

      List<ProductEntity> products = await  datasource.getProducts();

      return expect(products.isNotEmpty, true);

    }, timeout: Timeout(Duration(minutes: 1)));

    test("Verify timeout exception message on Get Products", () async {

      String value = "";

      try {

        throw TimeoutException('');

      } on TimeoutException { value = ExceptionMessageMapper.timeoutError; }

      return expect(value, ExceptionMessageMapper.timeoutError);

    }, timeout: Timeout(Duration(minutes: 1)));


    test("Find Products", () async {

      List<ProductEntity> products = await  datasource.getProducts();

      return expect(products.isNotEmpty, true);

    }, timeout: Timeout(Duration(minutes: 1)));

    test("Find Products by Name", () async {

      String value = "man";

      List<ProductEntity> products = <ProductEntity>[];

      try {

        products = await  datasource.getFilteredProducts(value: value.toLowerCase());

      } catch(e) { products = []; }

      return expect(products.length, greaterThan(0));

    }, timeout: Timeout(Duration(minutes: 1)));

    test("Verify Socket exception ", () async {

      String value = "";

      try {

        throw SocketException("");

      } on SocketException { value = ExceptionMessageMapper.socketError; }

      return expect(value, ExceptionMessageMapper.socketError);

    }, timeout: Timeout(Duration(minutes: 1)));

    test("Verify DioError Connection Error exception message ", () async {

      String value = "";

      try {

        throw DioException(requestOptions: RequestOptions(),type: DioExceptionType.connectionError);

      } on DioException catch(e) {

        if(e.type == DioExceptionType.connectionError) { value = ExceptionMessageMapper.socketError; }
        else if(e.type == DioExceptionType.connectionTimeout) { value = ExceptionMessageMapper.timeoutError; }
        else { value = ExceptionMessageMapper.apiError; }

      }

      return expect(value, ExceptionMessageMapper.socketError);

    }, timeout: Timeout(Duration(minutes: 1)));

    test("Verify DioError Connection timeout exception message ", () async {

      String value = "";

      try {

        throw DioException(requestOptions: RequestOptions(),type: DioExceptionType.connectionTimeout);

      } on DioException catch(e) {

        if(e.type == DioExceptionType.connectionError) { value = ExceptionMessageMapper.socketError; }
        else if(e.type == DioExceptionType.connectionTimeout) { value = ExceptionMessageMapper.timeoutError; }
        else { value = ExceptionMessageMapper.apiError; }

      }

      return expect(value, ExceptionMessageMapper.timeoutError);

    }, timeout: Timeout(Duration(minutes: 1)));

    test("Verify any DioError exception message ", () async {

      String value = "";

      try {

        throw DioException(requestOptions: RequestOptions(),type: DioExceptionType.badCertificate);

      } on DioException catch(e) {

        if(e.type == DioExceptionType.connectionError) { value = ExceptionMessageMapper.socketError; }
        else if(e.type == DioExceptionType.connectionTimeout) { value = ExceptionMessageMapper.timeoutError; }
        else { value = ExceptionMessageMapper.apiError; }

      }

      return expect(value, ExceptionMessageMapper.apiError);

    }, timeout: Timeout(Duration(minutes: 1)));

    test("Verify any DioError exception message ", () async {

      String value = "";

      try {

        throw DioException(requestOptions: RequestOptions(),type: DioExceptionType.badCertificate);

      } on DioException catch(e) {

        if(e.type == DioExceptionType.connectionError) { value = ExceptionMessageMapper.socketError; }
        else if(e.type == DioExceptionType.connectionTimeout) { value = ExceptionMessageMapper.timeoutError; }
        else { value = ExceptionMessageMapper.apiError; }

      }

      return expect(value, ExceptionMessageMapper.apiError);

    }, timeout: Timeout(Duration(minutes: 1)));

    test("Verify convert to map on Get Products ", () async {

      ProductEntity? product;

      try {
        Map<String, dynamic> mock = {
          "id": 1,
          "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
          "price": 109.95,
          "description": "Product Description",
          "category": "men's clothing",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          "rating": {"rate": 3.9, "count": 120}
        };

        product = ProductEntity.fromMap(mock);

      } catch(e) { product = null; }

      return expect(product?.id, 1);

    }, timeout: Timeout(Duration(minutes: 1)));

    test("Verify price with int convert to double value ", () async {

      ProductEntity? product;

      try {
        Map<String, dynamic> mock = {
          "id": 1,
          "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
          "price": 1,
          "description": "Product Description",
          "category": "men's clothing",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          "rating": {"rate": 3.9, "count": 120}
        };

        product = ProductEntity.fromMap(mock);

      } catch(e) { product = null; }

      return expect(product?.price, isA<double>());

    }, timeout: Timeout(Duration(minutes: 1)));

    test("Verify invalid value on Product ", () async {

      ProductEntity? product;

      try {
        Map<String, dynamic> mock = {
          "id": 1,
          "title": null,
          "price": 1,
          "description": "Product Description",
          "category": "men's clothing",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          "rating": {"rate": 3.9, "count": 120}
        };

        product = ProductEntity.fromMap(mock);

      } catch(e) { product = null; }

      return expect(product, null);

    }, timeout: Timeout(Duration(minutes: 1)));

    test("Verify price with double value ", () async {

      ProductEntity? product;

      try {

        Map<String, dynamic> mock = {
          "id": 1,
          "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
          "price": 10.0,
          "description": "Product Description",
          "category": "men's clothing",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          "rating": {"rate": 3.9, "count": 120}
        };

        product = ProductEntity.fromMap(mock);

      } catch(e) { product = null; }

      return expect(product?.price, isA<double>());

    }, timeout: Timeout(Duration(minutes: 1)));
  });
}