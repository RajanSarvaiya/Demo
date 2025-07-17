
String? validateOtp(String? value) {
    if (value != null && value.isEmpty) {
      return "Otp can not be empty";
    }
    if (value != null && value.length != 4) {
      return "Otp should be 4 digits";
    }
    return null;
  }
