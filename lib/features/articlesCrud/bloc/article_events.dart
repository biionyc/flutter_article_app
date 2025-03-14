import 'package:article_app/common/constants/string_constants.dart';

abstract class ArticleEvent {}

class GetArticlesEvent extends ArticleEvent {
  final int page;
  final String authors;
  final String categories;
  final String title;

  GetArticlesEvent({
    required this.page,
    this.authors = StringConstants.emptyString,
    this.categories = StringConstants.emptyString,
    this.title = StringConstants.emptyString,
  });
}

class GetArticleDetailsEvent extends ArticleEvent {
  final String id;

  GetArticleDetailsEvent({
    required this.id,
  });
}

class UpdateArticleEvent extends ArticleEvent {
  final String id;
  final String? title;
  final String? description;
  final String? author;
  final String? category;

  UpdateArticleEvent({
    required this.id,
    this.title,
    this.description,
    this.author,
    this.category,
  });
}

class CreateArticleEvent extends ArticleEvent {
  final String title;
  final String description;
  final int readTime;
  final String author;
  final String category;

  CreateArticleEvent({
    required this.title,
    required this.description,
    required this.readTime,
    required this.author,
    required this.category,
  });
}
