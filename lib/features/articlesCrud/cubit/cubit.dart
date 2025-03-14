import 'package:article_app/features/articlesCrud/cubit/cubit_state.dart';
import 'package:article_app/features/articlesCrud/utils/view_articles_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterState());

  void setFilter(FilterType type, String? value) {
    switch (type) {
      case FilterType.title:
        emit(state.copyWith(title: value));
        break;
      case FilterType.category:
        emit(state.copyWith(category: value));
        break;
      case FilterType.author:
        emit(state.copyWith(author: value));
        break;
    }
  }

  String? getFilter(FilterType type) {
    switch (type) {
      case FilterType.title:
        return state.title;
      case FilterType.category:
        return state.category;
      case FilterType.author:
        return state.author;
    }
  }

  bool hasNoFilters() {
    return state.title == null &&
        state.category == null &&
        state.author == null;
  }

  void resetFilters() {
    emit(const FilterState());
  }
}
