import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  String id;
  String name;
  String email;
  String password;
  String confirmPassword;

  AppUser({this.id, this.email, this.password, this.name, this.confirmPassword});

  AppUser.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.data()['name'] as String;
    email = document.data()['email'] as String;
  }

  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('users/$id');

  Future<void> savedData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
