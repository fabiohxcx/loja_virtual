// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserManager on _UserManager, Store {
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

  final _$_UserManagerActionController = ActionController(name: '_UserManager');

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
loading: ${loading}
    ''';
  }
}
