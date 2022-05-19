// Package imports:
import 'package:form_field_validator/form_field_validator.dart';

/// Email用のValidator
class CustomEmailValidator extends TextFieldValidator {
  CustomEmailValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
}