import 'dart:convert';
import 'package:article_app/common/constants/string_constants.dart';
import 'package:article_app/common/network/api_client.dart';
import 'package:article_app/features/articlesCrud/bloc/article_events.dart';
import 'package:article_app/features/articlesCrud/bloc/article_states.dart';
import 'package:article_app/features/articlesCrud/models/article.dart';
import 'package:article_app/features/articlesCrud/models/get_article_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ApiClient apiClient = ApiClient();
  ArticleBloc() : super(ArticleInitial()) {
    on<GetArticlesEvent>(_onGetArticlesEvent);
    on<GetArticleDetailsEvent>(_onGetArticleDetailsEvent);
    on<UpdateArticleEvent>(_onUpdateArticleEvent);
    on<CreateArticleEvent>(_onCreateArticleEvent);
  }

  Future<void> _onGetArticlesEvent(
    GetArticlesEvent event,
    Emitter<ArticleState> emit,
  ) async {
    emit(GetArticlesLoading());
    try {
      final String api = '${ApiConstants.article}?filters=${jsonEncode({
            'title': {
              'values': [event.title]
            },
            'category': {
              'values': [event.categories]
            },
            'author': {
              'values': [event.authors]
            }
          })}&size=10&page=${event.page}';
      final response = await apiClient.get(api);
      emit(GetArticlesSuccess(GetArticleResponse.fromJson(response['data'])));
    } catch (e) {
      emit(GetArticlesError(e.toString()));
    }
  }

  Future<void> _onGetArticleDetailsEvent(
    GetArticleDetailsEvent event,
    Emitter<ArticleState> emit,
  ) async {
    emit(GetArticleDetailsLoading());
    try {
      final String api = '${ApiConstants.article}/${event.id}';
      final response = await apiClient.get(api);
      emit(GetArticleDetailsSuccess(Article.fromJson(response['data'])));
    } catch (e) {
      emit(GetArticleDetailsError(e.toString()));
    }
  }

  Future<void> _onUpdateArticleEvent(
    UpdateArticleEvent event,
    Emitter<ArticleState> emit,
  ) async {
    emit(UpdateArticleLoading());
    try {
      Map<String, dynamic> request = {};

      if (event.title != null) {
        request = {...request, 'title': event.title!};
      }
      if (event.description != null) {
        request = {...request, 'description': event.description!};
      }
      if (event.category != null) {
        request = {...request, 'category': event.category!};
      }
      if (event.author != null) {
        request = {...request, 'author': event.author!};
      }

      final response =
          await apiClient.patch('${ApiConstants.article}/${event.id}', request);
      emit(UpdateArticleSuccess(Article.fromJson(response['data'])));
    } catch (e) {
      emit(GetArticleDetailsError(e.toString()));
    }
  }

  Future<void> _onCreateArticleEvent(
    CreateArticleEvent event,
    Emitter<ArticleState> emit,
  ) async {
    emit(UpdateArticleLoading());
    try {
      Map<String, dynamic> request = {
        'title': event.title,
        'description': event.description,
        'read_time': event.readTime,
        'author': event.author,
        'category': event.category,
      };

      final response = await apiClient.post(ApiConstants.article, request);
      emit(CreateArticleSuccess(Article.fromJson(response['data'])));
    } catch (e) {
      emit(GetArticleDetailsError(e.toString()));
    }
  }
}
