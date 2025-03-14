import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:article_app/features/articlesCrud/bloc/article_bloc.dart';
import 'package:article_app/features/articlesCrud/bloc/article_states.dart';
import 'package:article_app/features/articlesCrud/models/article.dart';
import 'package:article_app/features/articlesCrud/widgets/article_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUpdateScreen extends StatelessWidget {
  const EditUpdateScreen({super.key, this.article});

  final Article? article;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: NumberConstants.value_0,
            backgroundColor: Colors.white,
            title: Text(
              article == null ? StringConstants.createArticle : article!.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: NumberConstants.value_15,
                fontFamily: StringConstants.fontFamily,
                fontWeight: FontWeight.w600,
              ),
              maxLines: NumberConstants.value_2.toInt(),
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(
              bottom: NumberConstants.value_30,
            ),
            child: ArticleForm(
              article: article,
            ),
          ),
        ),
        BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is UpdateArticleLoading ||
                state is CreaateArticleLoading) {
              return Positioned.fill(
                child: ColoredBox(
                  color: Colors.black26,
                  child: Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}
