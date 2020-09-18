// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PageManager on _PageManager, Store {
  final _$currentPageAtom = Atom(name: '_PageManager.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$_PageManagerActionController = ActionController(name: '_PageManager');

  @override
  void setPage(int value) {
    final _$actionInfo = _$_PageManagerActionController.startAction(
        name: '_PageManager.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$_PageManagerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
