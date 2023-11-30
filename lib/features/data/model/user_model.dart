import 'package:mlaku_mlaku/features/domain/entities/user_ent.dart';

class UserModel extends UserEntity {
  UserModel({
    String? birthday,
    String? provience,
    String? city,
    String? noCc,
    String? validUntil,
    String? cvv,
    String? id,
    String? email,
    String? password,
    String? name,
  }) : super(
          birthday: birthday,
          provience: provience,
          city: city,
          noCc: noCc,
          validUntil: validUntil,
          cvv: cvv,
          id: id,
          email: email,
          password: password,
          name: name,
        );

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      password: entity.password,
      name: entity.name,
      birthday: entity.birthday,
      provience: entity.provience,
      city: entity.city,
      noCc: entity.noCc,
      validUntil: entity.validUntil,
      cvv: entity.cvv,
    );
  }

  //to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'birthday': birthday,
      'provience': provience,
      'city': city,
      'noCc': noCc,
      'validUntil': validUntil,
      'cvv': cvv,
    };
  }
}
