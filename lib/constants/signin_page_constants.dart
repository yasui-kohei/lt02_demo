import 'package:flutter/material.dart';
import 'package:lt02_demo/entity/tab_item.dart';
import 'package:lt02_demo/presentation/signin/login_page.dart';
import 'package:lt02_demo/presentation/signin/signup_page.dart';

/// Signinページのタブの中身が格納されている。
class SigninPageTabs {
  static final data = [
    // Signup用のタブ
    TabItem(
        tabId: 'signup',
        tab: Tab(
          child: Text('ユーザー登録'),
        ),
        view: SignupPage()),
    // Login用のタブ
    TabItem(
      tabId: 'login',
      tab: Tab(
        child: Text('ログイン'),
      ),
      view: LoginPage(),
    ),
  ];
}
