import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/di.dart';
import 'package:loja_virtual/models/page_manager.dart';

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int page;
  final PageManager _pageManager = getIt();

  DrawerTile({Key key, this.iconData, this.title, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;

    return Observer(builder: (_) {
      return InkWell(
        onTap: () {
          _pageManager.setPage(page);
        },
        child: SizedBox(
          height: 60,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Icon(iconData,
                    size: 32, color: _pageManager.currentPage == page ? color : Colors.grey[700]),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    color: _pageManager.currentPage == page ? color : Colors.grey[700]),
              )
            ],
          ),
        ),
      );
    });
  }
}
