String? validateEmail(String value) {
  RegExp regex =
      RegExp(r"^[a-zA-Z\d.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:.[a-zA-Z\d-]+)$");
  if (value.isEmpty || value.trim().isEmpty) {
    return 'Please enter email';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Please enter valid email';
    } else {
      return null;
    }
  }
}

String? validatePassword(String value) {
  if (value.isEmpty || value.trim().isEmpty) {
    return 'Please enter password';
  } else {
    if (value.length < 8) {
      return 'password length should be at least 8';
    } else if (RegExp(r'^(?=.[a-z])(?=.[A-Z])(?=.\d)[A-Za-z\d]{8,}$')
        .hasMatch(value)) {
      return 'password length should include special characters';
    } else if (RegExp(
            r'^(?=.[a-z])(?=.[A-Z])(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$')
        .hasMatch(value)) {
      return 'password length should include numbers';
    } else if (RegExp(r'^(?=.[a-z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$')
        .hasMatch(value)) {
      return 'password length should include capital characters';
    } else if (RegExp(r'^(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$')
        .hasMatch(value)) {
      return 'password length should include small characters';
    } else {
      return null;
    }
  }
}
