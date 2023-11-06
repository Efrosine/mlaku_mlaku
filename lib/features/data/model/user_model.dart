import 'package:mlaku_mlaku/features/domain/entities/user_ent.dart';

class UserModel extends UserEntity {
  UserModel({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? address,
    String? image,
  }) : super(
          name: name,
          email: email,
          password: password,
          phone: phone,
          address: address,
          image: image,
        );

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name,
      email: entity.email,
      password: entity.password,
      phone: entity.phone,
      address: entity.address,
      image: entity.image,
    );
  }
}
