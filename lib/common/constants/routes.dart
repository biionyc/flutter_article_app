import 'package:article_app/features/articlesCrud/models/article.dart';

class RouteName {
  static const String home = 'home';
  static const String details = 'details';
  static const String notifications = 'notifications';
  static const String bookmarks = 'bookmarks';
  static const String profile = 'profile';
  static const String editUpdateScreen = 'editUpdateScreen';
}

class RoutePath {
  static const String home = '/home';
  static const String details = '/details';
  static const String notifications = '/notifications';
  static const String bookmarks = '/bookmarks';
  static const String profile = '/profile';
  static const String editUpdateScreen = '/editUpdateScreen';
}

class DetailsScreenRouteParams {
  final String id;

  DetailsScreenRouteParams({required this.id});
}

class EditUpdateScreenRouteParams {
  final Article? article;

  EditUpdateScreenRouteParams({this.article});
}
