import 'package:equatable/equatable.dart';

class GeoEntity extends Equatable {
  const GeoEntity({required this.id, required this.name});

  final String? id, name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
