import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controlllers;
  final String? labeltext;
  final Widget? counterText;
  final bool obscureText;
  final TextInputType keboard;
  final String hinttext;
  final Widget sufex;
  final String? Function(String?)? validations;
  const CustomTextField(
      {super.key,
      this.obscureText = false,
      this.counterText,
      this.controlllers,
      required this.hinttext,
      required this.keboard,
      this.labeltext,
      this.validations,
      required this.sufex});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validations,
      keyboardType: keboard,
      controller: controlllers,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        counter: counterText,
        suffixIcon: sufex,
        labelText: labeltext,
        hintText: hinttext,
        enabledBorder: OutlineInputBorder(

          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
           borderSide: BorderSide(color: Colors.white70),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
