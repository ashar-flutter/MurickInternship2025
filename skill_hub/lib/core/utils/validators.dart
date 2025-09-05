class Validators {
  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) return 'Email is required';
    final re = RegExp(r'^[\w-.]+@([\w-]+\.)+\w{2,4}$');
    if (!re.hasMatch(v.trim())) return 'Enter a valid email';
    return null;
  }

  static String? password(String? v) {
    if (v == null || v.isEmpty) return 'Password is required';
    if (v.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  static String? requiredField(String? v, String label) {
    if (v == null || v.trim().isEmpty) return '$label is required';
    return null;
  }
}
