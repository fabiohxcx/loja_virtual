// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserManager on _UserManager, Store {
  final _$userAtom = Atom(name: '_UserManager.user');

  @override
  AppUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(AppUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$loadingAtom = Atom(name: '_UserManager.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$signInAsyncAction = AsyncAction('_UserManager.signIn');

  @override
  Future<void> signIn({AppUser user, Function onFail, Function onSuccess}) {
    return _$signInAsyncAction.run(
        () => super.signIn(user: user, onFail: onFail, onSuccess: onSuccess));
  }

  final _$signUpAsyncAction = AsyncAction('_UserManager.signUp');

  @override
  Future<void> signUp({AppUser user, Function onFail, Function onSuccess}) {
    return _$signUpAsyncAction.run(
        () => super.signUp(user: user, onFail: onFail, onSuccess: onSuccess));
  }

  final _$_UserManagerActionController = ActionController(name: '_UserManager');

  @override
  void signOut() {
    final _$actionInfo = _$_UserManagerActionController.startAction(
        name: '_UserManager.signOut');
    try {
      return super.signOut();
    } finally {
      _$_UserManagerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading({bool value}) {
    final _$actionInfo = _$_UserManagerActionController.startAction(
        name: '_UserManager.setLoading');
    try {
      return super.setLoading(value: value);
    } finally {
      _$_UserManagerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
loading: ${loading}
    ''';
  }
}
