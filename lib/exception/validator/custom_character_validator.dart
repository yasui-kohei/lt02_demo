// Package imports:
import 'package:form_field_validator/form_field_validator.dart';

/// 半角英数字記号のみ入力可能なValidator
class CustomCharacterValidator extends TextFieldValidator {
  CustomCharacterValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+$").hasMatch(value!);
}