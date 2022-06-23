import 'package:login_widget/login_field_validator_implementation.dart';

/// A generic, common-use login field validator
class GenericLoginFieldValidator implements LoginFieldValidatorImplementation {
  final int maxLength;
  final int minLength;
  final bool allowEmpty;

  GenericLoginFieldValidator({
    this.maxLength = 256,
    this.minLength = 0,
    this.allowEmpty = false,
  });

  @override
  String? validate(String? input) {
    if (input == null) {
      return 'Invalid';
    } else if (!allowEmpty && input == '') {
      return 'Cannot be empty';
    } else if (input.length > maxLength) {
      return 'Too long';
    } else if (input.length < minLength) {
      return 'Too short';
    }
    return null;
  }
}