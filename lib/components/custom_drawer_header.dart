import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:loja_virtual/screens/login_screen.dart';

import '../di.dart';

class CustomDrawerHeader extends StatelessWidget {
  final UserManager userManager = getIt();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
        height: 180,
        child: Observer(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Loja do \nDaniel",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              Text(
                'Olá, ${userManager.user?.name ?? ''}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (userManager.isLogged) {
                    userManager.signOut();
                  } else {
                    Navigator.of(context).pushNamed(LoginScreen.id);
                  }
                },
                child: Text(
                  userManager.isLogged ? 'Sair' : 'Entre ou cadastre-se',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          );
        }));
  }
}
