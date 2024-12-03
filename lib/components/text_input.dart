import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {super.key,
      required this.prefixIcon,
      this.label,
      this.isPassword = false,
      this.inputType = TextInputType.none,
      this.onChanged});

  final String? label;
  final bool isPassword;
  final IconData prefixIcon;
  final TextInputType inputType;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: inputType,
      autocorrect: false,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        labelText: label,
      ),
    );
  }
}
