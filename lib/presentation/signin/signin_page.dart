import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// サインインの画面ページ
class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [

            // 名前の入力フォーム
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "メールアドレス"
                ),
                onChanged: (String value) {
                  //Todo ViewModelの値を変更する。
                },
              ),
            ),

            // メールアドレスの入力フォーム
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "メールアドレス"
                ),
                onChanged: (String value) {
                  //Todo ViewModelの値を変更する。
                },
              ),
            ),

            // パスワードの入力フォーム
            Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "パスワード(8~20文字)"
                ),
                obscureText: true,
                maxLength: 20,
                onChanged: (String value) {
                  //Todo ViewModelの値を変更する。
                },
              ),
            ),

            // ログイン開始ボタン
            ElevatedButton(
                onPressed: () {
                  //Todo ViewModelでの処理を行う。
                  context.go('/top');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey, //ボタンの背景色
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "サインイン",
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
