import 'package:flutter/material.dart';

class TextFildInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String myHintText;
  final TextInputType textInputType;

  const TextFildInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.myHintText,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: myHintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
