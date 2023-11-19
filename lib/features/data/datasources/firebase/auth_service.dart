import 'package:firebase_auth/firebase_auth.dart';
import 'package:mlaku_mlaku/features/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  AuthService(this._auth, this._prefs);

  final FirebaseAuth _auth;
  final SharedPreferences _prefs;

  Future<void> authCheck() async {
    _auth.authStateChanges().listen((event) {
      if (event == null) {
        _prefs.clear();
      } else {
        _prefs.setString('uid', event.uid);
      }
    });
  }

  String? getUserId() {
    return _prefs.getString('uid');
  }

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
