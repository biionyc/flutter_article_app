import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:article_app/features/articlesCrud/widgets/red_dot.dart';
import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.showRedDot,
  });

  final String title;
  final VoidCallback onTap;
  final bool showRedDot;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Text(
                '${StringConstants.filterBasedOn}$title',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: NumberConstants.value_17,
                  fontFamily: StringConstants.fontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (showRedDot)
                Positioned(
                  right: -NumberConstants.value_7,
                  child: RedDot(),
                ),
            ],
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
