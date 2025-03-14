import 'dart:developer';

import 'package:article_app/common/constants/number_constants.dart';
import 'package:article_app/common/constants/routes.dart';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:article_app/common/widgets/custom_snackbar.dart';
import 'package:article_app/features/articlesCrud/bloc/article_bloc.dart';
import 'package:article_app/features/articlesCrud/bloc/article_events.dart';
import 'package:article_app/features/articlesCrud/bloc/article_states.dart';
import 'package:article_app/features/articlesCrud/cubit/cubit.dart';
import 'package:article_app/features/articlesCrud/models/article.dart';
import 'package:article_app/features/articlesCrud/utils/view_articles_utils.dart';
import 'package:article_app/features/articlesCrud/widgets/article_tile.dart';
import 'package:article_app/features/articlesCrud/widgets/no_articles_available.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({super.key});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  final List<Article> _articles = [];
  int _currentPage = NumberConstants.value_1.toInt();
  int _totalCount = NumberConstants.value_0.toInt();
  bool _isLoadingMore = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _getArticles();
    _scrollController.addListener(_loadMore);
  }

  void _getArticles() {
    final filterCubit = context.read<FilterCubit>();
    context.read<ArticleBloc>().add(
          GetArticlesEvent(
            page: _currentPage,
            title: filterCubit.getFilter(FilterType.title) ??
                StringConstants.emptyString,
            categories: filterCubit.getFilter(FilterType.category) ??
                StringConstants.emptyString,
            authors: filterCubit.getFilter(FilterType.author) ??
                StringConstants.emptyString,
          ),
        );
  }

  void _retry() {
    _currentPage = NumberConstants.value_1.toInt();
    _totalCount = NumberConstants.value_0.toInt();
    _getArticles();
    _articles.clear();
  }

  void _loadMore() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent *
                FractionConstants.value_0_7 &&
        !_isLoadingMore &&
        _articles.length < _totalCount) {
      _isLoadingMore = true;
      _getArticles();
    }
  }

  void _updateArticleLocally(Article updatedArticle) {
    final index =
        _articles.indexWhere((article) => article.id == updatedArticle.id);
    if (index != -NumberConstants.value_1) {
      setState(() {
        _articles[index] = updatedArticle;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_loadMore);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleBloc, ArticleState>(
      listener: (context, state) {
        if (state is GetArticlesError) {
          showSnackBar(context, state.message);
          _isLoadingMore = false;
        } else if (state is GetArticlesSuccess) {
          if (state.response.currentPage == NumberConstants.value_1) {
            _totalCount = state.response.totalRecords;
            _articles.clear();
          }
          _currentPage =
              state.response.currentPage + NumberConstants.value_1.toInt();
          _isLoadingMore = false;
          _articles.addAll(state.response.records);
        }
      },
      buildWhen: (previous, current) {
        return current is GetArticlesLoading ||
            current is GetArticlesSuccess ||
            current is GetArticleDetailsError;
      },
      builder: (context, state) {
        inspect(state);
        if (state is GetArticlesLoading &&
            _currentPage == NumberConstants.value_1) {
          return Expanded(
            child: ColoredBox(
              color: Colors.grey[NumberConstants.value_100.toInt()]!,
              child: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          );
        } else {
          return Flexible(
            child: ColoredBox(
              color: Colors.grey[NumberConstants.value_100.toInt()]!,
              child: RefreshIndicator.adaptive(
                onRefresh: () async {
                  _retry();
                },
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(
                        top: NumberConstants.value_10,
                        left: NumberConstants.value_20,
                        right: NumberConstants.value_20,
                        bottom: NumberConstants.value_30,
                      ),
                      sliver: SliverList.separated(
                        itemBuilder: (context, index) {
                          return ArticleTile(
                            key: ValueKey(index),
                            article: _articles[index],
                            onTapTile: () {
                              context.pushNamed(
                                RouteName.details,
                                extra: DetailsScreenRouteParams(
                                  id: _articles[index].id,
                                ),
                              );
                            },
                            onTapEdit: () => context
                                .pushNamed(
                              RouteName.editUpdateScreen,
                              extra: EditUpdateScreenRouteParams(
                                article: _articles[index],
                              ),
                            )
                                .then(
                              (value) {
                                if (value != null && value is Article) {
                                  _updateArticleLocally(value);
                                }
                              },
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: NumberConstants.value_10,
                          );
                        },
                        itemCount: _articles.length,
                      ),
                    ),
                    if (state is GetArticlesSuccess && _articles.isEmpty)
                      SliverFillRemaining(
                        child: NoArticlesAvailable(),
                      ),
                    if (_isLoadingMore)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: NumberConstants.value_10,
                            bottom: NumberConstants.value_30,
                          ),
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
