import 'package:equatable/equatable.dart';

class FilterState extends Equatable {
  final String? title;
  final String? category;
  final String? author;

  const FilterState({
    this.title,
    this.category,
    this.author,
  });

  FilterState copyWith({
    String? title,
    String? category,
    String? author,
  }) {
    return FilterState(
      title: title ?? this.title,
      category: category ?? this.category,
      author: author ?? this.author,
    );
  }

  @override
  List<Object?> get props => [title, category, author];
}
