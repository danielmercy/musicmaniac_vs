import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ProfileProvider with ChangeNotifier {
  // final AuthService _authService = AuthService();
  // final ProfileService _profileService = ProfileService(_authService.cur;

  final FirebaseUser user;

  ProfileProvider(this.user);

  // Future<User> get currentUser async => await _profileService.currentUser(user);

  // // void _currentUser() async {
  // //   currentUser = await _profileService.currentUser();
  // // }

  // Future<void> signOut() async {
  //   await _authService.signOut();
  //   notifyListeners();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
