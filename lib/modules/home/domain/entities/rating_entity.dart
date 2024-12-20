


import 'package:ecommerce/modules/home/domain/mappers/rating_mapper.dart';

class RatingEntity {


  final double rate;
  final int count;

  RatingEntity({required this.rate, required this.count});

  factory RatingEntity.fromMap(Map<String,dynamic> map) =>
      RatingEntity(
          rate: map[RatingMapper.rate] is int ? map[RatingMapper.rate].toDouble() : map[RatingMapper.rate],
          count: map[RatingMapper.count]);

  toMap() => {
    RatingMapper.rate: rate,
    RatingMapper.count: count
  };

}