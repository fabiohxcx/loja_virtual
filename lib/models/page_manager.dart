import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'page_manager.g.dart';

class PageManager = _PageManager with _$PageManager;

abstract class _PageManager with Store {
  final PageController _pageController;

  @observable
  int currentPage = 0;

  _PageManager(this._pageController);

  @action
  void setPage(int value) {
    if (currentPage == value) return;
    currentPage = value;
    _pageController.jumpToPage(value);
  }
}
