import 'package:formz/formz.dart';

import '../../../common/constants/regex_constants.dart';

enum UsernameValidationError { empty, invalid }

class EmailAddressUsernameValidator extends FormzInput<String, UsernameValidationError> {
  const EmailAddressUsernameValidator.pure() : super.pure('');
  const EmailAddressUsernameValidator.dirty([String value = '']) : super.dirty(value);

  @override
  UsernameValidationError? validator(String value) {
    if (!RegExp(RegexConstants.validEmailRegex).hasMatch(value)) {
      return UsernameValidationError.invalid;
    }
  }
}
