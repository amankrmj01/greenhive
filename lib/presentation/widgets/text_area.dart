import 'package:flutter/material.dart';

class MyTextArea extends StatefulWidget {
  final TextEditingController controller;
  final bool isObscure;
  final String labelText;
  final Icon? preFixIcon;
  final bool prefix;
  final TextInputType textInputType;
  const MyTextArea({
    super.key,
    required this.controller,
    required this.isObscure,
    required this.labelText,
    this.preFixIcon,
    required this.prefix,
    required this.textInputType,
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
      child: TextField(
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
        controller: widget.controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          fillColor: Color.lerp(Colors.white, Colors.teal, 0.1),
          filled: true,
          // icon: widget.icon,
          prefixIcon: widget.prefix ? widget.preFixIcon : null,
          suffixIcon: widget.isObscure
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off))
              : null,
          // labelText: widget.labelText,
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
