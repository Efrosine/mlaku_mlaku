import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({

    this.birthday,
    this.provience,
    this.city,
    this.noCc,
    this.validUntil,
    this.cvv,
    this.id,
    this.email,
    this.password,
    this.name,
  });

  final String? birthday;
  final String? city;
  final String? cvv;
  final String? email;
  final String? id;
  final String? name;
  final String? noCc;
  final String? password;
  final String? provience;
  final String? validUntil;


  @override
  List<Object?> get props => [
        email,
        password,
        id,
        name,

        birthday,
        provience,
        city,
        noCc,
        validUntil,
        cvv,

      ];

  //copty with
  UserEntity copyWith({
    String? birthday,
    String? city,
    String? cvv,
    String? email,
    String? id,
    String? name,
    String? noCc,
    String? password,
    String? provience,
    String? validUntil,
  }) {
    return UserEntity(
      birthday: birthday ?? this.birthday,
      city: city ?? this.city,
      cvv: cvv ?? this.cvv,
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
      noCc: noCc ?? this.noCc,
      password: password ?? this.password,
      provience: provience ?? this.provience,
      validUntil: validUntil ?? this.validUntil,
    );
  }
}
