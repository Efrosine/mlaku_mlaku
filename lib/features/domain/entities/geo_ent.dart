import 'package:equatable/equatable.dart';

class GeoEntity extends Equatable {
  final String? id, name;

  GeoEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
