import 'package:flutter/material.dart';

class TextFieldAuth extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;

  const TextFieldAuth({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
  });

  @override
  State<TextFieldAuth> createState() => _TextFieldAuthState();
}

class _TextFieldAuthState extends State<TextFieldAuth> {
  bool isInvisible = false;
  @override
  void initState() {
    isInvisible = !widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: !isInvisible,
      decoration: InputDecoration(
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isInvisible = !isInvisible;
                  });
                },
                icon: Icon(isInvisible ? Icons.visibility_off : Icons.visibility),
              )
            : null,
      ),
    );
  }
}
