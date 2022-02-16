import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/data/repository/auth/auth_repository.impl.dart';
import 'package:task_manager/data/repository/firestore/firestore_repository.impl.dart';
import 'package:task_manager/ui/login/login_state.dart';

final loginViewModelProvider =
StateNotifierProvider.autoDispose<LoginViewModel, AsyncValue<LoginState>>(
      (ref) => LoginViewModel(ref: ref),
);

class LoginViewModel extends StateNotifier<AsyncValue<LoginState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  LoginViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  late final authRepository = _ref.read(authRepositoryProvider);
  late final firestoreRepository = _ref.watch(firestoreRepositoryProvider);


  /// 通信、初期化処理
  Future<void> load() async {
    // Mockデータ
    state = const AsyncValue.data(
      LoginState(
        email: 'eat2pic@23-creative.co.jp',
        password: 'password',
      ),
    );
  }

  Future<void> login() async {
    await authRepository.googleSignIn();
  }

  /// ロード制御
  Future<dynamic> whileLoading(Future Function() future) {
    return Future.microtask(toLoading)
        .then<dynamic>((_) => future())
        .whenComplete(toIdle);
  }

  /// ロード開始
  void toLoading() {
    state = AsyncValue.data(state.value!.copyWith(isLoading: true));
  }

  /// ロード終了
  void toIdle() {
    state = AsyncValue.data(state.value!.copyWith(isLoading: false));
  }
}
