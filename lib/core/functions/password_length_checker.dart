List<bool> checkPasswordStrength(String value) {
  List<bool> strengthCriteria = [
    value.length >= 8,
    value.contains(RegExp(r'[A-Z]')),
    value.contains(RegExp(r'[a-z]')),
    value.contains(RegExp(r'[0-9]')),
    value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
  ];

  return strengthCriteria;
}
