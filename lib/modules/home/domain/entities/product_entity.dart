


import 'package:ecommerce/modules/home/domain/entities/rating_entity.dart';
import 'package:ecommerce/modules/home/domain/mappers/product_mapper.dart';

class ProductEntity {

  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;

  final RatingEntity rating;

  ProductEntity({
    required this.id,
    required this.title, required this.price,
    required this.category, required this.description,
    required this.image, required this.rating });


  factory ProductEntity.fromMap(Map<String,dynamic> map) =>
      ProductEntity(
          id: map[ProductMapper.id],
          title: map[ProductMapper.title],
          price: map[ProductMapper.price] is int ? map[ProductMapper.price].toDouble() : map[ProductMapper.price],
          category: map[ProductMapper.category],
          description: map[ProductMapper.description],
          image: map[ProductMapper.image],
          rating: RatingEntity.fromMap(map[ProductMapper.rating])
      );

  toMap() => {
    ProductMapper.id: id,
    ProductMapper.title: title,
    ProductMapper.price: price,
    ProductMapper.category: category,
    ProductMapper.description: description,
    ProductMapper.image: image,
    ProductMapper.rating: rating.toMap()
  };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is ProductEntity) { return id == other.id; }
    return false;
  }

  @override
  int get hashCode => id.hashCode;


}