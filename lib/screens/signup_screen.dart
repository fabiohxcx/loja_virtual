import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';

import '../di.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = 'signup';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final AppUser user = AppUser();

  final UserManager userManager = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Center(child: Observer(builder: (_) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Name'),
                  keyboardType: TextInputType.text,
                  onSaved: (name) => user.name = name,
                  enabled: !userManager.loading,
                  validator: (name) {
                    if (name.isEmpty) {
                      return 'Mandatory Field';
                    }

                    if (name.trim().split(' ').length <= 1) {
                      return 'Input full name';
                    }
                    if (name.length < 4) {
                      return 'Name invalid';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  enabled: !userManager.loading,
                  onSaved: (email) => user.email = email,
                  validator: (email) {
                    if (email.isEmpty) {
                      return 'Mandatory Field';
                    }

                    if (!emailValid(email)) {
                      return 'E-mail invalid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Password'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  enabled: !userManager.loading,
                  obscureText: true,
                  onSaved: (pass) => user.password = pass,
                  validator: (pass) {
                    if (pass.isEmpty || pass.length < 6) {
                      return 'Password invalid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Password Again'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  obscureText: true,
                  enabled: !userManager.loading,
                  onSaved: (pass) => user.confirmPassword = pass,
                  validator: (pass) {
                    if (pass.isEmpty || pass.length < 6) {
                      return 'Password invalid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: userManager.loading
                        ? null
                        : () {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();

                              if (user.password != user.confirmPassword) {
                                scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: const Text('Passwords doesn`t match!'),
                                  backgroundColor: Colors.red,
                                ));
                              }
                              userManager.signUp(
                                  user: user,
                                  onFail: (e) {
                                    scaffoldKey.currentState.showSnackBar(SnackBar(
                                      content: Text('Fail: $e'),
                                      backgroundColor: Colors.red,
                                    ));
                                  },
                                  onSuccess: () {
                                    Navigator.of(context).pop();
                                  });
                            }
                          },
                    color: Theme.of(context).primaryColor,
                    disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                    child: userManager.loading
                        ? const CircularProgressIndicator()
                        : const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                  ),
                )
              ],
            ),
          ),
        );
      })),
    );
  }
}
