import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool initialObscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Color? iconColor;
  final int? maxLength;

  const TextFormFieldWidget({
    Key? key,
    required this.label,
    required this.icon,
    required this.controller,
    this.initialObscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.iconColor,
    this.maxLength,
  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.initialObscureText;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0), // Daha büyük padding
      child: TextFormField(
        controller: widget.controller,
        obscureText: obscureText,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        style: const TextStyle(fontSize: 18), // Giriş yazısı büyük
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: widget.iconColor,
            size: 28,
          ), // Büyük ikon
          suffixIcon:
              widget.initialObscureText
                  ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: widget.iconColor,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  )
                  : null,
          labelText: widget.label,
          labelStyle: const TextStyle(fontSize: 18), // Label yazısı büyük
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 16.0,
          ), // Alan yüksekliği
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
