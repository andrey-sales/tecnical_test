


import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:ecommerce/modules/home/domain/entities/product_entity.dart';
import 'package:ecommerce/modules/home/domain/exceptions/api_error_exception.dart';
import 'package:ecommerce/modules/home/domain/exceptions/server_exception.dart';
import 'package:ecommerce/modules/home/domain/exceptions/timout_search_exception.dart';
import 'package:ecommerce/modules/home/domain/exceptions/unknown_exception.dart';
import 'package:ecommerce/modules/home/domain/mappers/exception_message_mapper.dart';
import 'package:ecommerce/modules/home/infra/datasources/product_datasource_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductRemoteDataSource implements IProductDataSource {
  
  final Dio _dio = Modular.get<Dio>();
  
  @override
  Future<List<ProductEntity>> getProducts() async {
    
    try {

      Response response = await _dio.get("https://fakestoreapi.com/products")
          .timeout(Duration(seconds: 10));

      if(response.statusCode == 200) {
        return await Isolate.run<List<ProductEntity>>(() {
          final List<dynamic> data = response.data;
          return data.map((e) => ProductEntity.fromMap(e)).toList();
      });
    }

    else { return []; }

    }

    on DioException catch(e) {

      if(e.type == DioExceptionType.connectionError) { throw ServerException(ExceptionMessageMapper.socketError); }
      else if(e.type == DioExceptionType.connectionTimeout) { throw TimeoutException(ExceptionMessageMapper.timeoutError); }
      else { throw APIErrorException(ExceptionMessageMapper.apiError); }

    }

    on TimeoutException { throw TimeOutSearchException(ExceptionMessageMapper.timeoutError); }
    on SocketException { throw SocketException(ExceptionMessageMapper.socketError); }

    catch(e) { throw UnknownException(ExceptionMessageMapper.genericError); }

  }

  @override
  Future<List<ProductEntity>> getFilteredProducts({ required String value }) async {

    try{

    Response response = await _dio.get("https://fakestoreapi.com/products?name=$value").timeout(Duration(seconds: 10));

    if(response.statusCode == 200) {
      return await Isolate.run<List<ProductEntity>>(() {
        final List<dynamic> data = response.data;
        return data.map((e) => ProductEntity.fromMap(e)).toList();
      });
    }

    else { return []; } }

    on DioException catch(e) {

      if(e.type == DioExceptionType.connectionError) { throw ServerException(ExceptionMessageMapper.socketError); }
      else if(e.type == DioExceptionType.connectionTimeout) { throw TimeoutException(ExceptionMessageMapper.timeoutErrorSearch); }
      else { throw APIErrorException(ExceptionMessageMapper.apiErrorSearch); }

    }
    on SocketException { throw SocketException(ExceptionMessageMapper.socketError); }
    on TimeoutException { throw TimeoutException(ExceptionMessageMapper.timeoutErrorSearch); }

    catch(e) { throw UnknownException(ExceptionMessageMapper.genericError); }
  }
}