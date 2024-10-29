import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PasswordTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 304,
      height: 40,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: _isObscure,
        decoration: InputDecoration(
          hintText: widget.hintText ?? 'Enter password',
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontFamily: 'Anuphan',
            fontWeight: FontWeight.w300,
          ),
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: Color(0xFF222831),
            size: 20,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility_off : Icons.visibility,
              color: const Color(0xFF222831),
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF222831)),
          ),
        ),
      ),
    );
  }
}