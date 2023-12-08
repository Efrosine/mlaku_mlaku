import 'package:equatable/equatable.dart';

class HotelsEntity extends Equatable {
  HotelsEntity({
    this.address,
    this.description,
    this.image,
    this.id,
    this.name,
    this.price,
    this.rating,
    this.stars,
  });

  final String? address;
  final String? description;
  final int? id;
  final String? image;
  final String? name;
  final Map<String, dynamic>? price;
  final double? rating;
  final int? stars;

  @override
  List<Object?> get props => [
        address,
        description,
        image,
        id,
        name,
        price,
        rating,
        stars,
      ];
}
