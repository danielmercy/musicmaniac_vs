// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<Stream<FirebaseUser>> _$onAuthStateChangedComputed;

  @override
  Stream<FirebaseUser> get onAuthStateChanged =>
      (_$onAuthStateChangedComputed ??=
              Computed<Stream<FirebaseUser>>(() => super.onAuthStateChanged))
          .value;
  Computed<User> _$currentUserComputed;

  @override
  User get currentUser =>
      (_$currentUserComputed ??= Computed<User>(() => super.currentUser)).value;

  final _$_currentUserAtom = Atom(name: '_UserStore._currentUser');

  @override
  User get _currentUser {
    _$_currentUserAtom.context.enforceReadPolicy(_$_currentUserAtom);
    _$_currentUserAtom.reportObserved();
    return super._currentUser;
  }

  @override
  set _currentUser(User value) {
    _$_currentUserAtom.context.conditionallyRunInAction(() {
      super._currentUser = value;
      _$_currentUserAtom.reportChanged();
    }, _$_currentUserAtom, name: '${_$_currentUserAtom.name}_set');
  }

  final _$stateAtom = Atom(name: '_UserStore.state');

  @override
  LoadingState get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(LoadingState value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future<void> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  final _$registerAsyncAction = AsyncAction('register');

  @override
  Future<void> register(Map<String, dynamic> data) {
    return _$registerAsyncAction.run(() => super.register(data));
  }
}
