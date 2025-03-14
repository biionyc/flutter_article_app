import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isDisabled,
  });

  final String title;
  final bool isDisabled;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? 0.6 : 1,
      child: Material(
        borderRadius: BorderRadius.circular(NumberConstants.value_58),
        child: InkWell(
          borderRadius: BorderRadius.circular(NumberConstants.value_58),
          onTap: onTap,
          child: Ink(
            padding: const EdgeInsets.symmetric(
              vertical: NumberConstants.value_18,
              horizontal: NumberConstants.value_60,
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(NumberConstants.value_58),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: NumberConstants.value_18,
                fontFamily: StringConstants.fontFamily,
                fontWeight: FontWeight.w700,
                height: NumberConstants.value_1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
