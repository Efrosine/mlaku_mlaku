import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
     this.id,
    this.email,
    this.password,
    this.name,
    this.photo,
  });

  final String? email;
  final String? password;
  final String? id;
  final String? name;
  final String? photo;

  @override
  List<Object?> get props => [
        email,
        password,
        id,
        name,
        photo,
      ];
}
