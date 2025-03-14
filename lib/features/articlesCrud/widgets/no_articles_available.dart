import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:flutter/material.dart';

class NoArticlesAvailable extends StatelessWidget {
  const NoArticlesAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: NumberConstants.value_10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.article_outlined,
            size: NumberConstants.value_40,
            color: Colors.blueAccent,
          ),
          Text(
            StringConstants.noArticlesFound,
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: NumberConstants.value_20,
              fontFamily: StringConstants.fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
