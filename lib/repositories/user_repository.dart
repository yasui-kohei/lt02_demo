import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lt02_demo/domain/user.dart';

/// User情報を取得するRepositoryクラス
class UserRepository {
  UserRepository._(){
   isSignin();
  }
  static final instance = UserRepository._();
  /// ユーザー情報
  static User? currentUser;
  final _db = FirebaseFirestore.instance;
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  Future<bool> signupWithEmail(
      {required String email, required String password, required String name}) async {
    try {
      auth.UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password,);
      auth.User firebaseUser = credential.user!;

      User convertUser = convertToUser(firebaseUser, name);
      await _db
          .collection('users')
          .doc(convertUser.userId)
          .set(convertUser.toMap());
      final query = await _db
          .collection('users')
          .where('userId', isEqualTo: firebaseUser.uid)
          .get();
      currentUser = User.fromMap(query.docs[0].data());
      print(currentUser);
      return true;
    } on Exception catch (e, st) {
      print(e);
      print(st);
      rethrow;
    } on Error catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  Future<bool> isSignin() async {
    final firebaseUser = await _auth.currentUser;
    if (firebaseUser != null) {
      final query = await _db.collection('users').where('userId' ,isEqualTo: firebaseUser.uid).get();
      currentUser = User.fromMap(query.docs[0].data());
      return true;
    }
    return false;
  }

  Future<User> fetchCurrentUser(String userId) async {
    final query = await _db.collection('users').where('userId' ,isEqualTo: userId).get();
    currentUser = User.fromMap(query.docs[0].data());
    return currentUser!;
  }

  User convertToUser(auth.User firebaseUser, String name) {
    return User(
      userId: firebaseUser.uid,
      name: name,
      email: firebaseUser.email!,
    );
  }
}
