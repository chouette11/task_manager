import 'package:task_manager/data/model/result/result.dart';
import 'package:task_manager/data/model/user_document/user_document.dart';
import 'package:task_manager/types/task.dart';

abstract class FirestoreRepository {
  /// ユーザー情報を取得
  Future<Result<UserDocument>> getUser();

  Future<Result<void>> createUser({
    required String name,
    required String token,
  });

  Future<Result<void>> addTask({
    required Map<String, dynamic> task
  });

  Future<Result<void>> onCheck({
    required Task taskData
});
}