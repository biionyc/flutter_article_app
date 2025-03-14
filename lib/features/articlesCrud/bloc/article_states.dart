import 'package:article_app/features/articlesCrud/models/article.dart';
import 'package:article_app/features/articlesCrud/models/get_article_model.dart';

abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class GetArticlesLoading extends ArticleState {}

class GetArticleDetailsLoading extends ArticleState {}

class UpdateArticleLoading extends ArticleState {}

class CreaateArticleLoading extends ArticleState {}

class GetArticlesSuccess extends ArticleState {
  final GetArticleResponse response;
  GetArticlesSuccess(this.response);
}

class GetArticleDetailsSuccess extends ArticleState {
  final Article details;
  GetArticleDetailsSuccess(this.details);
}

class UpdateArticleSuccess extends ArticleState {
  final Article updatedDetails;
  UpdateArticleSuccess(this.updatedDetails);
}

class CreateArticleSuccess extends ArticleState {
  final Article createdDetails;
  CreateArticleSuccess(this.createdDetails);
}

class GetArticlesError extends ArticleState {
  final String message;
  GetArticlesError(this.message);
}

class GetArticleDetailsError extends ArticleState {
  final String message;
  GetArticleDetailsError(this.message);
}

class UpdateArticleError extends ArticleState {
  final String message;
  UpdateArticleError(this.message);
}
