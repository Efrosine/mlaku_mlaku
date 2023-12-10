import 'package:mlaku_mlaku/features/domain/entities/hotels_ent.dart';

class HotelsModel extends HotelsEntity {
  HotelsModel({
    required super.address,
    required super.description,
    required super.image,
    required super.id,
    required super.name,
    required super.price,
    required super.rating,
    required super.stars,
  });

  factory HotelsModel.fromEntity(HotelsEntity entity) {
    return HotelsModel(
      address: entity.address,
      description: entity.description,
      image: entity.image,
      id: entity.id,
      name: entity.name,
      price: entity.price,
      rating: entity.rating,
      stars: entity.stars,
    );
  }

  factory HotelsModel.fromJson(Map<String, dynamic> json) {
    final data = json['property'];
    return HotelsModel(
      address: data['address'],
      description: data['description'],
      image: data['photoUrls'][0],
      id: data['id'],
      name: data['name'],
      price: data['priceBreakdown']['grossPrice'],
      rating: data['reviewScore'].runtimeType == double
          ? data['reviewScore']
          : data['reviewScore'].toDouble(),
      stars: data['propertyClass'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'description': description,
      'image': image,
      'id': id,
      'name': name,
      'price': price,
      'rating': rating,
      'stars': stars,
    };
  }
}
