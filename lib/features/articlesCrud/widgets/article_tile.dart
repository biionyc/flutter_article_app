import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:article_app/features/articlesCrud/models/article.dart';
import 'package:article_app/features/articlesCrud/utils/view_articles_utils.dart';
import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    super.key,
    required this.article,
    required this.onTapTile,
    required this.onTapEdit,
  });

  final Article article;
  final VoidCallback onTapTile;
  final VoidCallback onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTapTile,
        borderRadius: BorderRadius.circular(
          NumberConstants.value_20,
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              NumberConstants.value_20,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(NumberConstants.value_15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: NumberConstants.value_10,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: StringConstants.inText,
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
                            text: article.category,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: NumberConstants.value_15,
                              fontFamily: StringConstants.fontFamily,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(width: NumberConstants.value_4),
                          ),
                          TextSpan(
                            text: StringConstants.by,
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
                            text: article.author,
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
                  ],
                ),
                const SizedBox(
                  height: NumberConstants.value_10,
                ),
                Text(
                  article.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: NumberConstants.value_20,
                    fontFamily: StringConstants.fontFamily,
                    fontWeight: FontWeight.w500,
                    height: FractionConstants.value_1_3,
                  ),
                  maxLines: NumberConstants.value_2.toInt(),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: NumberConstants.value_5,
                ),
                Text(
                  article.description,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: NumberConstants.value_14,
                    fontFamily: StringConstants.fontFamily,
                    fontWeight: FontWeight.w500,
                    height: FractionConstants.value_1_3,
                  ),
                  maxLines: NumberConstants.value_2.toInt(),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: NumberConstants.value_15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatDate(article.createdAt),
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: NumberConstants.value_14,
                        fontFamily: StringConstants.fontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: onTapEdit,
                      icon: Icon(
                        Icons.edit,
                        size: NumberConstants.value_20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
