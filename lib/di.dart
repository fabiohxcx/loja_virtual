import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:loja_virtual/models/page_manager.dart';

import 'models/user_manager.dart';

final GetIt getIt = GetIt.instance;

void setupDI() {
  getIt.registerSingleton<PageController>(PageController());
  getIt.registerLazySingleton(() => PageManager(getIt()));
  getIt.registerLazySingleton(() => UserManager());
}
