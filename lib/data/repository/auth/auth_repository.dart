import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/data/model/result/result.dart';

abstract class AuthRepository {
  User? get currentUser;

  /// Email&パスワード認証
  Future<Result<User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Google認証
  Future<GoogleSignInAccount?> googleSignIn();


  /// Email&パスワード認証ユーザー作成
  Future<Result<User>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    int? age,
    int? height,
    int? weight,
  });

  // メールアドレス更新
  Future<Result<void>> updateEmail({
    required String email,
  });

  /// ログアウト
  Future<Result<void>> signOut();
}