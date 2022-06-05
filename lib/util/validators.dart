String validateEmail(String value) {
  String _msg;
  if (value.isEmpty) {
    _msg = "Your name is required";
  }
  return _msg;
}
