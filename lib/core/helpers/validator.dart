import 'package:form_field_validator/form_field_validator.dart';

class Validator {
  static final Validator _singleton = Validator._internal();
  factory Validator() {
    return _singleton;
  }
  Validator._internal();

  RequiredValidator requiredValidator =
      RequiredValidator(errorText: 'Required Field');
  EmailValidator emailValidator = EmailValidator(errorText: 'Invalid Email');
}

class Validations {
  static Validator validator = Validator();

  //TODO: Special Validations
}
