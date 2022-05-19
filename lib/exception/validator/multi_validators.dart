

import 'package:form_field_validator/form_field_validator.dart';
import 'package:lt02_demo/exception/validator/custom_character_validator.dart';
import 'package:lt02_demo/exception/validator/custom_email_validator.dart';
import 'package:lt02_demo/exception/validator/custom_password_validator.dart';

/// メールアドレス入力フォーム用のvalidator
final emailValidator = MultiValidator([
  RequiredValidator(errorText: "メールアドレスを入力してください。"),
  CustomEmailValidator(errorText: "有効なメールアドレスを入力してください。"),
]);

/// パスワード入力フォーム用のvalidator
final passwordValidator = MultiValidator([
  RequiredValidator(errorText: "パスワードを入力してください。"),
  MinLengthValidator(8, errorText: "パスワードは8文字以上で入力してください。"),
  CustomCharacterValidator(errorText: "パスワードは半角英字と数字もしくは記号の組み合わせで入力してください。"),
  CustomPasswordValidator(errorText: "パスワードは半角英字と数字もしくは記号の組み合わせで入力してください。"),
  //CustomPasswordValidator(errorText: "より強力なパスワードを選択してください。\n文字、数字、記号の組み合わせをお試しください。"),
]);

/// パスワード確認用のvalidator
final passwordConfirmValidator = MatchValidator(errorText: "パスワードが一致しませんでした。もう一度お試しください。");