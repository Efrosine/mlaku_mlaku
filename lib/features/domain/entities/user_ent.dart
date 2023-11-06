import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? address;
  final String? image;

  const UserEntity({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.image,
  });
  @override
  List<Object?> get props => [
        name,
        email,
        password,
        phone,
        address,
        image,
      ];
}
