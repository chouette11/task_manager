import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/data/model/result/result.dart';
import 'auth_provider.dart';
import 'auth_repository.dart';

final authRepositoryProvider =
Provider<AuthRepository>((ref) => AuthRepositoryImpl(ref.read));

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._reader);
  final Reader _reader;

  late final _firebaseAuth = _reader(authProvider);

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<Result<User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return Result.guardFuture(() async {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!;
    });
  }

  @override
  Future<Result<void>> updateEmail({
    required String email,
  }) {
    return Result.guardFuture(() async {
      await currentUser!.updateEmail(email);
    });
  }

  @override
  Future<Result<void>> signOut() async {
    return Result.guardFuture(() async {
      await _firebaseAuth.signOut();
    });
  }

  @override
  Future<Result<User>> createUserWithEmailAndPassword({required String name, required String email, required String password, int? age, int? height, int? weight}) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<GoogleSignInAccount?> googleSignIn() async {
    GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      'https://www.googleapis.com/auth/calendar',
    ]).signIn();
  }
}
