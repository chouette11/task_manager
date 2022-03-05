import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/data/model/result/result.dart';
import 'package:task_manager/data/model/user_document/user_document.dart';
import 'package:task_manager/data/repository/auth/auth_repository.impl.dart';
import 'package:task_manager/data/repository/firestore/firestore_provider.dart';
import 'package:task_manager/data/repository/firestore/firestore_repository.dart';

final firestoreRepositoryProvider =
Provider<FirestoreRepository>((ref) => FirestoreRepositoryImpl(ref.read));

class FirestoreRepositoryImpl implements FirestoreRepository {
  FirestoreRepositoryImpl(this._reader);

  final Reader _reader;
  late final _firestore = _reader(firestoreProvider);
  late final _authRepository = _reader(authRepositoryProvider);

  /// ユーザーコレクション
  late final _usersCollection = _firestore.collection('users');

  @override
  Future<Result<UserDocument>> getUser() {
    return Result.guardFuture(() async {
      final currentUser = _authRepository.currentUser;
      if (currentUser != null) {
        final doc = await _usersCollection.doc(currentUser.uid).get();
        final user = UserDocument.fromDocument(doc);
        return user;
      } else {
        throw FirebaseAuthException(
          code: 'auth/custom-error',
          message: 'The authenticated user does not exist.',
        );
      }
    });
  }

  @override
  Future<Result<void>> createUser({
    required String name,
    required String token,
  }) {
    return Result.guardFuture(() async {
      final currentUser = _authRepository.currentUser;
      if (currentUser != null) {
        final createUser = UserDocument(
          id: currentUser.uid,
          name: name,
          token: token,
        );
        await _usersCollection.doc(currentUser.uid).set(createUser.toJson());
      } else {
        throw FirebaseAuthException(
          code: 'auth/custom-error',
          message: 'The authenticated user does not exist.',
        );
      }
    });
  }

  @override
  Future<Result<void>> addTask({
    required Map<String, dynamic> task,
  }) {
    return Result.guardFuture(() async {
      final currentUser = _authRepository.currentUser;
      if (currentUser != null) {
        await _tasksCollection.doc("フクダ").update({
            'taskData': FieldValue.arrayUnion([task]),
          }
        );
      } else {
        throw FirebaseAuthException(
          code: 'auth/custom-error',
          message: 'The authenticated user does not exist.',
        );
      }
    });
  }

}
