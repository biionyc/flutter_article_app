import 'package:article_app/features/articlesCrud/models/article.dart';

class GetArticleResponse {
  final int totalRecords;
  final int currentPage;
  final int lastPage;
  final List<Article> records;
  final int count;

  GetArticleResponse({
    required this.totalRecords,
    required this.currentPage,
    required this.lastPage,
    required this.records,
    required this.count,
  });

  factory GetArticleResponse.fromJson(Map<String, dynamic> json) {
    return GetArticleResponse(
      totalRecords: json['total_records'] ?? 0,
      currentPage: json['current_page'] ?? 1,
      lastPage: json['last_page'] ?? 1,
      records: (json['records'] as List?)
              ?.map((e) => Article.fromJson(e))
              .toList() ??
          [],
      count: json['count'] ?? 0,
    );
  }
}
