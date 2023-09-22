import 'package:flutter/material.dart';

class TextFormFieldBasic extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final String hintText;

  const TextFormFieldBasic({
    required this.controller,
    this.onSubmitted,
    this.validator,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: hintText,
      ),
      onFieldSubmitted: onSubmitted,
      validator: validator,
      controller: controller,
    );
  }
}
