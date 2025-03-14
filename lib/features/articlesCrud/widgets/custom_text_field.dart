import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.maxLength,
    this.validator,
    this.labelText,
    this.onChanged,
    this.keyboardType,
    this.maxLines = 1,
    this.initialValue,
    this.textStyle,
    this.controller,
  });

  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? initialValue;
  final TextStyle? textStyle;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      initialValue: initialValue,
      style: textStyle,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: NumberConstants.value_16,
          horizontal: NumberConstants.value_16,
        ),
        labelText: labelText,
        hintText: hintText,
        floatingLabelStyle: TextStyle(
          color: Colors.grey[NumberConstants.value_600.toInt()]!,
          fontFamily: StringConstants.fontFamily,
          fontWeight: FontWeight.w400,
          height: NumberConstants.value_1,
        ),
        labelStyle: TextStyle(
          color: Colors.grey[NumberConstants.value_600.toInt()]!,
          fontSize: NumberConstants.value_14,
          fontFamily: StringConstants.fontFamily,
          fontWeight: FontWeight.w400,
          height: NumberConstants.value_1,
        ),
        counterText: StringConstants.emptyString,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: NumberConstants.value_1,
            color: Colors.grey[NumberConstants.value_400.toInt()]!,
          ),
          borderRadius: BorderRadius.circular(NumberConstants.value_16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: NumberConstants.value_1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(NumberConstants.value_16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: NumberConstants.value_1,
            color: Colors.redAccent,
          ),
          borderRadius: BorderRadius.circular(NumberConstants.value_16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: NumberConstants.value_1,
            color: Colors.redAccent,
          ),
          borderRadius: BorderRadius.circular(NumberConstants.value_16),
        ),
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontSize: NumberConstants.value_14,
          fontFamily: StringConstants.fontFamily,
          fontWeight: FontWeight.w400,
          height: NumberConstants.value_1,
        ),
        alignLabelWithHint: maxLines != null ? true : false,
        hintStyle: TextStyle(
          color: Colors.grey[NumberConstants.value_600.toInt()]!,
          fontSize: NumberConstants.value_14,
          fontFamily: StringConstants.fontFamily,
          fontWeight: FontWeight.w400,
          height: NumberConstants.value_1,
        ),
        floatingLabelBehavior: labelText != null
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
      ),
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      cursorHeight: NumberConstants.value_18,
      maxLength: maxLength,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else if (validator != null) {
          return validator!(value);
        } else {
          return null;
        }
      },
      onChanged: onChanged,
    );
  }
}
