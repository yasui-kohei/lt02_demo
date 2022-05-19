// Package imports:
import 'package:form_field_validator/form_field_validator.dart';

class CustomPasswordValidator extends TextFieldValidator {
  CustomPasswordValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) =>
      isCheckPassword(value);

  /// 文字、数字、記号の組み合わせになっている場合、true
  bool isCheckPassword(String? password) {
    bool hasSmallChara = isContainSmallChara(password);
    bool hasLargeChara = isContainLargeChara(password);
    bool hasNumber = isContainNumber(password);
    bool hasOptionalChara = isContainOptionalChara(password);
    // 文字、数字、記号いずれかの組み合わせになっているかのチェック
    if(hasSmallChara && hasNumber && hasOptionalChara) return true;
    if(hasLargeChara && hasNumber && hasOptionalChara) return true;
    if(hasSmallChara && hasNumber) return true;
    if(hasLargeChara && hasNumber) return true;
    if(hasSmallChara && hasOptionalChara) return true;
    if(hasLargeChara && hasOptionalChara) return true;
    return false;
  }

  /// パスワードに小文字が含まれている場合、true
  bool isContainSmallChara (String? password) {
    if (!password!.contains(RegExp(r"[a-z]"))) return false;
    return true;
  }
  /// パスワードに大文字が含まれている場合、true
  bool isContainLargeChara(String? password) {
    if (!password!.contains(RegExp(r"[A-Z]"))) return false;
    return true;
  }
  /// パスワードに数字が含まれている場合、true
  bool isContainNumber(String? password) {
    if (!password!.contains(RegExp(r"[0-9]"))) return false;
    return true;
  }
  /// パスワードに記号が含まれている場合、true
  bool isContainOptionalChara(String? password) {
    if (!password!.contains(RegExp(r"[!#$%&'*+-/=?^_`{|}~]"))) return false;
    return true;
  }


}