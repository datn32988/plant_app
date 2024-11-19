import 'package:flutter/material.dart';

class appInputField extends StatelessWidget {
  final String hinText;
  final IconData preFixIcon;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  const appInputField(
      {super.key,
      required this.hinText,
      required this.preFixIcon,
      required this.textEditingController,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        decoration: InputDecoration(
          hintText: hinText,
          prefixIcon: Icon(preFixIcon),
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
