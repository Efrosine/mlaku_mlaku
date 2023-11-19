import 'package:mlaku_mlaku/features/domain/entities/geo_ent.dart';

class GeoModel extends GeoEntity {
  const GeoModel({required super.id, required super.name});

  factory GeoModel.fromEntity(GeoEntity entity) {
    return GeoModel(
      id: entity.id,
      name: entity.name,
    );
  }

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
