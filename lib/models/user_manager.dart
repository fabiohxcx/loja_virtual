import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/models/user.dart';

import 'package:mobx/mobx.dart';

part 'user_manager.g.dart';

class UserManager = _UserManager with _$UserManager;

abstract class _UserManager with Store {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @observable
  bool loading = false;

  @action
  Future<void> signIn({AppUser user, Function onFail, Function onSuccess}) async {
    setLoading(value: true);
    debugPrint('${user.email} ${user.password}');
    try {
      await auth.signInWithEmailAndPassword(email: user.email, password: user.password);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(e.message);
    }
    setLoading(value: false);
  }

  // ignore: use_setters_to_change_properties
  @action
  void setLoading({bool value}) {
    loading = value;
  }
}
