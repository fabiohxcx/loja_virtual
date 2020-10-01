import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({Key key, this.initialText}) : super(key: key);
  final String initialText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 2,
            left: 4,
            right: 4,
            child: Card(
              child: TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    prefixIcon: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })),
                initialValue: initialText,
                onFieldSubmitted: (text) {
                  Navigator.of(context).pop(text);
                },
              ),
            ))
      ],
    );
  }
}
