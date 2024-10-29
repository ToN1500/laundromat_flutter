import 'package:flutter/material.dart';

class UsernameTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const UsernameTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<UsernameTextField> createState() => _UsernameTextFieldState();
}

class _UsernameTextFieldState extends State<UsernameTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 304,
      height: 40,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText ?? 'Enter username',
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontFamily: 'Anuphan',
            fontWeight: FontWeight.w300,
          ),
          prefixIcon: const Icon(
            Icons.person_outline,
            color: Color(0xFF222831),
            size: 20,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
