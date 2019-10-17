import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:musicmaniac/repositories/auth.repository.dart';

class AuthProvider extends ChangeNotifier {
  static final AuthService _authService = AuthService();

  FirebaseUser _currentUser;

  FirebaseUser get currentUser => _currentUser ?? null;

  set currentUser(FirebaseUser user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<FirebaseUser> signUp(Map<String, dynamic> data) async {
    currentUser = await _authService.signUp(data);
    return currentUser;
  }

  Future<FirebaseUser> login(String email, String password) async {
    currentUser =
        await _authService.signInWithEmailAndPassword(email, password);
    return currentUser ?? null;
  }

  Future<void> signOut() async {
    currentUser = null;
    return await _authService.signOut();
  }

  Stream<FirebaseUser> get onAuthStateChanged {
    return _authService.onAuthStateChanged;
  }
}
