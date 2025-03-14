import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:flutter/material.dart';

class ArticleDetailsScreenAppBar extends StatelessWidget {
  const ArticleDetailsScreenAppBar({super.key, required this.category});

  final String? category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NumberConstants.value_18,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BackButton(),
          if (category != null)
            Expanded(
              child: Text(
                category!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: NumberConstants.value_15,
                  fontFamily: StringConstants.fontFamily,
                  fontWeight: FontWeight.w600,
                  height: FractionConstants.value_1_3,
                ),
                textAlign: TextAlign.center,
                maxLines: NumberConstants.value_2.toInt(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
        ],
      ),
    );
  }
}
