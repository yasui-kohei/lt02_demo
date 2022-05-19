import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lt02_demo/domain/user.dart';
import 'package:lt02_demo/repositories/post_repository.dart';
import 'package:lt02_demo/repositories/user_repository.dart';

/// Signin画面の状態管理用プロバイダー
final signinProvider = ChangeNotifierProvider((ref) => SigninModel._());

/// Signin画面の状態管理
class SigninModel extends ChangeNotifier {
  SigninModel._();

  final UserRepository userRepository = UserRepository.instance;

  /// nameのTextEditingController
  final nameController = TextEditingController();

  /// emailのTextEditingController
  final emailController = TextEditingController();

  /// passwordのTextEditingController
  final passwordController = TextEditingController();

  /// Trueの時、パスワードを隠す。
  bool passwordObscure = true;

  /// Loding状態であれば、True
  bool isLoading = false;

  /// パスワードを隠すかどうか切り替える関数
  void togglePasswordObscure() {
    passwordObscure = !passwordObscure;
    notifyListeners();
  }

  /// ユーザー登録を行う
  Future<void> signupWithEmail() async {
    isLoading = true;
    notifyListeners();

    try {
      await userRepository.signupWithEmail(
          email: emailController.text, password: passwordController.text, name: nameController.text);
    } on Exception catch (e, st) {
      rethrow;
    } on Error catch (e, st) {
      rethrow;
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> login() async{
    isLoading = true;
    notifyListeners();

    try {
      await userRepository.loginWithEmail(emailController.text,passwordController.text);
    } on Exception catch (e) {

    }

    isLoading = false;
    notifyListeners();
  }
}
