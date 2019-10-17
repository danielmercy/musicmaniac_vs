import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:musicmaniac/providers/auth.provider.dart';
import 'package:musicmaniac/repositories/auth.repository.dart';
import 'package:musicmaniac/models/user.model.dart';
import 'package:musicmaniac/repositories/profile.repository.dart';

part 'user.g.dart';

class UserStore = _UserStore with _$UserStore;

enum LoadingState { Loading, Completed, Error, None }

abstract class _UserStore with Store {

  AuthService _authService = AuthService();
  AuthProvider _authProvider = AuthProvider();
  ProfileService _profileService = ProfileService();

  @observable
  User _currentUser;

  @observable
  LoadingState state = LoadingState.None;

  @computed
  Stream<FirebaseUser> get onAuthStateChanged => _authService.onAuthStateChanged;

  @computed 
  User get currentUser {
    state = LoadingState.Loading;
    if(_currentUser != null)
      return _currentUser;
    try {
      _authService.currentUser().then((value) {
        return _profileService.currentUser(value.uid);
      }).then((response) {
        _currentUser = response;
      });
    } catch (e) {
      state = LoadingState.Error;
      throw new AuthException(e?.code, e?.message);
    }
    state = LoadingState.Completed;
    return  _currentUser ?? null;
  }

  @action
  set currentUser(User value) {
    this._currentUser = value;
  }

  @action 
  Future<void> login(String email, String password) async {
    try {
      state = LoadingState.Loading;
      FirebaseUser _cu = await _authService.signInWithEmailAndPassword(email, password);
      currentUser = await _profileService.currentUser(_cu.uid);
    } catch (e) {
      state = LoadingState.Error;
      throw new AuthException(e?.code, e?.message);
    }
    state = LoadingState.Completed;
  }

  @action 
  Future<void> register(Map<String, dynamic> data) async {
    try {
      state = LoadingState.Loading;
      FirebaseUser _cu = await _authService.signUp(data);
      currentUser = await _profileService.currentUser(_cu.uid);
    } catch (e) {
      state = LoadingState.Error;
      throw new AuthException(e?.code, e?.message);
    }
    state = LoadingState.Completed;
  }

  @action 
  Future<void> logout() async {
    currentUser = null;
    await _authProvider.signOut();
  }

  void dispose() {}
}