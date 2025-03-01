import 'package:flutter/material.dart';
import 'package:lost_and_found/core/presentation/widgets/text_field.dart';

class PersonalizedFormWithTextInsertion extends StatelessWidget {
  final void Function(String) onTextChanged;
  final String hintText;
  final bool showError;
  final bool isValid;
  final String? errorText;
  final String text;
  final int maxLines;

  const PersonalizedFormWithTextInsertion(
      {super.key,
      this.text = "",
      required this.onTextChanged,
      required this.hintText,
      required this.errorText,
      required this.isValid,
        this.maxLines = 4,
      required this.showError});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PersonalizedTextField(
          onTextChanged: onTextChanged,
          errorText: errorText,
          showError: showError,
          isValid: isValid,
          hintText: hintText,
          text: text,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
