import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/data/repository/auth/auth_repository.impl.dart';

final drawerViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => DrawerViewModel(ref));

class DrawerViewModel extends ChangeNotifier {
  DrawerViewModel(this._ref);
  final AutoDisposeChangeNotifierProviderRef _ref;

  late final authRepository = _ref.read(authRepositoryProvider);

  // 登録情報編集に遷移


}
