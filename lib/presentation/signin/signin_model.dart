
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Signin画面の状態管理用プロバイダー
final signinProvider = ChangeNotifierProvider((ref) => SigninModel._());

/// Signin画面の状態管理
class SigninModel extends ChangeNotifier {
  SigninModel._();

  /// nameのTextEditingController
  final nameController = TextEditingController();
  /// emailのTextEditingController
  final emailController = TextEditingController();
  /// passwordのTextEditingController
  final passwordController = TextEditingController();
  /// Trueの時、パスワードを隠す。
  bool passwordObscure = true;

  /// パスワードを隠すかどうか切り替える関数
  void togglePasswordObscure() {
    passwordObscure = !passwordObscure;
    notifyListeners();
  }


}