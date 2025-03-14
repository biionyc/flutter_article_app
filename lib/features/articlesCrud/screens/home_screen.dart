import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/features/articlesCrud/widgets/article_list.dart';
import 'package:article_app/features/articlesCrud/widgets/home_screen_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: NumberConstants.value_30,
            ),
            HomeScreenAppBar(),
            SizedBox(
              height: NumberConstants.value_10,
            ),
            ArticleList(),
          ],
        ),
      ),
    );
  }
}
