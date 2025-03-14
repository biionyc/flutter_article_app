import 'package:article_app/common/constants/number_constants.dart';
import 'package:flutter/material.dart';

class RedDot extends StatelessWidget {
  const RedDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: NumberConstants.value_10,
      width: NumberConstants.value_10,
      decoration: ShapeDecoration(
        color: Colors.redAccent,
        shape: OvalBorder(),
      ),
    );
  }
}
