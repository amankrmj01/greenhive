import 'package:flutter/material.dart';

class MyTextArea extends StatefulWidget {
  final TextEditingController controller;
  final bool isObscure;
  final String labelText;
  final Icon? preFixIcon;
  final bool prefix;
  final TextInputType textInputType;
  final String? Function(String?)? validator;

  const MyTextArea({
    super.key,
    required this.controller,
    required this.isObscure,
    required this.labelText,
    this.preFixIcon,
    required this.prefix,
    required this.textInputType,
    this.validator,
  });

  @override
  State<MyTextArea> createState() => _MyTextAreaState();
}

class _MyTextAreaState extends State<MyTextArea> {
  late bool isObscure;

  @override
  void initState() {
    isObscure = widget.isObscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TextFormField(
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
        controller: widget.controller,
        obscureText: isObscure,
        keyboardType: widget.textInputType,
        validator: widget.validator,
        decoration: InputDecoration(
          fillColor: Color.lerp(Colors.white, Colors.teal, 0.1),
          filled: true,
          prefixIcon: widget.prefix ? widget.preFixIcon : null,
          suffixIcon: widget.isObscure
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          hintText: widget.labelText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
