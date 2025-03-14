import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context,
  String content, {
  bool? isSuccess = false,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: const TextStyle(
            color: Colors.white,
            fontSize: NumberConstants.value_14,
            fontFamily: StringConstants.fontFamily,
            fontWeight: FontWeight.w400,
            height: NumberConstants.value_1,
          ),
        ),
        backgroundColor: isSuccess! ? Colors.blueAccent : Colors.redAccent,
        dismissDirection: DismissDirection.down,
      ),
    );
}
