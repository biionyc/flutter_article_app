import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:article_app/features/articlesCrud/models/article.dart';
import 'package:article_app/features/articlesCrud/utils/view_articles_utils.dart';
import 'package:flutter/material.dart';

class ArticleDetailsBody extends StatelessWidget {
  const ArticleDetailsBody({super.key, required this.articleDetails});

  final Article articleDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NumberConstants.value_30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            articleDetails.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: NumberConstants.value_25,
              fontFamily: StringConstants.fontFamily,
              fontWeight: FontWeight.w700,
              height: FractionConstants.value_1_3,
            ),
          ),
          SizedBox(
            height: NumberConstants.value_20,
          ),
          Text(
            articleDetails.author,
            style: TextStyle(
              color: Colors.black,
              fontSize: NumberConstants.value_15,
              fontFamily: StringConstants.fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: StringConstants.publishedIn,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: NumberConstants.value_14,
                    fontFamily: StringConstants.fontFamily,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                WidgetSpan(
                  child: SizedBox(width: NumberConstants.value_4),
                ),
                TextSpan(
                  text: articleDetails.category,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: NumberConstants.value_15,
                    fontFamily: StringConstants.fontFamily,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${articleDetails.readTime} min read',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: NumberConstants.value_14,
                    fontFamily: StringConstants.fontFamily,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                WidgetSpan(
                  child: SizedBox(width: NumberConstants.value_4),
                ),
                TextSpan(
                  text: StringConstants.bulletText,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: NumberConstants.value_15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                WidgetSpan(
                  child: SizedBox(width: NumberConstants.value_4),
                ),
                TextSpan(
                  text: formatDate(articleDetails.createdAt),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: NumberConstants.value_14,
                    fontFamily: StringConstants.fontFamily,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: NumberConstants.value_20,
          ),
          Text(
            articleDetails.description,
            style: TextStyle(
              color: Colors.black,
              fontSize: NumberConstants.value_17,
              fontFamily: StringConstants.fontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
