import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/models/user.dart';

import 'package:mobx/mobx.dart';

part 'user_manager.g.dart';

class UserManager = _UserManager with _$UserManager;

abstract class _UserManager with Store {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @observable
  AppUser user = AppUser();

  _UserManager() {
    _loadCurrentUser();
  }

  bool get isLogged => user != null;

  @observable
  bool loading = false;

  @action
  Future<void> signIn({AppUser user, Function onFail, Function onSuccess}) async {
    setLoading(value: true);
    debugPrint('${user.email} ${user.password}');
    try {
      final result =
          await auth.signInWithEmailAndPassword(email: user.email, password: user.password);

      await _loadCurrentUser(firebaseUser: result.user);

      await onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(e.message);
    }
    setLoading(value: false);
  }

  @action
  void signOut() {
    auth.signOut();
    // ignore: parameter_assignments
    user = null;
  }

  @action
  Future<void> signUp({AppUser user, Function onFail, Function onSuccess}) async {
    setLoading(value: true);
    debugPrint('${user.email} ${user.password}');
    try {
      final result =
          await auth.createUserWithEmailAndPassword(email: user.email, password: user.password);
      user.id = result.user.uid;
      this.user = user;
      await user.savedData();
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

  Future<void> _loadCurrentUser({User firebaseUser}) async {
    final currentUser = firebaseUser ?? auth.currentUser;

    if (currentUser != null) {
      final docUser = await firebaseFirestore.collection('users').doc(currentUser.uid).get();

      user = AppUser.fromDocument(docUser);

      debugPrint('UID: ${user.id} ${user.name} ${user.email}');
    }
  }
}
