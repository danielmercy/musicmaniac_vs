import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseAuth {
  Future<FirebaseUser> currentUser();
  Future<FirebaseUser> signInWithEmailAndPassword(
      String email, String password);
  Future<FirebaseUser> createUserWithEmailAndPassword(
      String email, String password);
  Future<void> setUserInfo(FirebaseUser user, Map<String, dynamic> data);
  Future<void> sendPasswordResetEmail(String email);
  Future<void> signOut();
  Future<FirebaseUser> signUp(Map<String, dynamic> data);
  Stream<FirebaseUser> get onAuthStateChanged;
  void dispose();
}

// BaseUser _userFromFirebase(FirebaseUser user) {
//   if (user == null) {
//     return null;
//   }
//   return BaseUser(uid: user.uid, email: user.email ?? '');
// }

class AuthService implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  refactorUserProfile(FirebaseUser user, Map<String, dynamic> data) {
    final Map<String, dynamic> profile = {
      "firstname": data['firstname'],
      "lastname": data['lastname'],
      "username": data['username'],
      "email": data['email'],
      "genre": data['genre'],
      "phone": data['phone'],
      "role": data['role'] ?? 'fan',
      "uid": user.uid,
      "address": {
        'addr': data['address']['addr'],
        'state': data['address']['state'],
        'zip': data['address']['zip'],
      },
    };

    return profile;
  }

  @override
  Stream<FirebaseUser> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged;
  }

  @override
  Future<FirebaseUser> signInWithEmailAndPassword(
      String email, String password) async {
    AuthResult authResult;
    try {
      authResult = await _firebaseAuth
          .signInWithCredential(EmailAuthProvider.getCredential(
        email: email,
        password: password,
      ));
    } catch (e) {
      print(e);
      throw new AuthException(e.code, e.message);
    }
    return authResult?.user;
  }

  @override
  Future<FirebaseUser> createUserWithEmailAndPassword(
      String email, String password) async {
    AuthResult authResult;
    try {
      authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
      throw new AuthException(e.code, e.message);
    }
    return authResult?.user;
  }

  @override
  Future<FirebaseUser> signUp(Map<String, dynamic> data) async {
    AuthResult authResult;
    try {
      authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: data['email'], password: data['password']);
      if(authResult?.user != null) {
        await this.setUserInfo(authResult.user, data);
      }
    } catch (e) {
      print(e);
      throw new AuthException(e.code, e.message);
    } 

    return authResult?.user;
  }

  @override
  Future<void> setUserInfo(FirebaseUser user, Map<String, dynamic> data) async {
    final profile = refactorUserProfile(user, data);
    try {
      print("From setUserInfo $profile");
      await _firestore
          .collection('users')
          .document(user.uid)
          .setData(profile);
    } catch (e) {
      print(e);
      throw new Exception(e.toString());
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<FirebaseUser> currentUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  void dispose() {}
}
