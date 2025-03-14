import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:flutter/material.dart';

class UnderDevelopment extends StatelessWidget {
  const UnderDevelopment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          spacing: NumberConstants.value_20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.build,
              size: NumberConstants.value_60,
              color: Colors.blueAccent,
            ),
            Text(
              StringConstants.underDevelopment,
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: NumberConstants.value_25,
                fontFamily: StringConstants.fontFamily,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
