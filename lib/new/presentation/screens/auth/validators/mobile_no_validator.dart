

String? validateMobileNo(String? value) {
  if (value == null || value.isEmpty) {
    return "Phone number can not be empty";
  } else if (value.length != 10) {
    return "Invalid phone number";
  }
  return null;
}
