import 'package:task_manager/data/model/result/result.dart';
import 'package:task_manager/data/model/user_document/user_document.dart';

abstract class FirestoreRepository {
  /// ユーザー情報を取得
  Future<Result<UserDocument>> getUser();

  Future<Result<void>> createUser({
    required String name,
    required String token,
  });
}