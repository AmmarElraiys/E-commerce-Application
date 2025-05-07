class PhoneValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    // Sadece rakam ve minimum 10 haneli (ülkene göre değişebilir)
    if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
      return "Enter a valid phone number";
    }

    return null; // geçerli
  }
}
