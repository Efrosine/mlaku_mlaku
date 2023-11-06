import 'package:firebase_auth/firebase_auth.dart';
import 'package:mlaku_mlaku/features/data/model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Future<UserCredential> signIn(UserModel model) async {
    return await _auth.signInWithEmailAndPassword(
      email: model.email!,
      password: model.password!,
    );
  }

  Future<UserCredential> signUp(UserModel model) async {
    return await _auth.createUserWithEmailAndPassword(
      email: model.email!,
      password: model.password!,
    );
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
