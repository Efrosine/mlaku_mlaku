import 'package:mlaku_mlaku/features/domain/entities/user_ent.dart';

class UserModel extends UserEntity {
  const UserModel({
    String? id,
    String? email,
    String? password,
    String? name,
    String? photo,
  }) : super(
          id: id,
          email: email,
          password: password,
          name: name,
          photo: photo,
        );

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      password: entity.password,
      name: entity.name,
      photo: entity.photo,
    );
  }
}
