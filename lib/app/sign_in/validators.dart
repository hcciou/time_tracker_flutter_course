abstract class StringValidator {
  bool isValid({String values});
}

class NonEmptyStringValidators implements StringValidator {
  @override
  bool isValid({String values}) {
    return values.isNotEmpty;
  }
}

class EmailAndPasswordValidators {
  final StringValidator emailValidator = NonEmptyStringValidators();
  final StringValidator passwordValidator = NonEmptyStringValidators();
  final String inValidEmailErrorText = 'Email 欄位不得為空！';
  final String inValidPasswordErrorText = 'Password 欄位不得為空！';
}
