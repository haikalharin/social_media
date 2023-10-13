part of 'user_page_bloc.dart';

@immutable
abstract class UserPageEvent extends Equatable {
  const UserPageEvent();

  @override
  List<Object> get props => [];
}

enum SortEnum { asc, desc }

class ArticleFetchEvent extends UserPageEvent {
  const ArticleFetchEvent({
    this.page = 0,
    this.isBottomScroll = false,
    this.category = '',
    this.isSearch = false,
    this.isRefresh = false,
    this.isMovie = true,
    this.keyword = '',
  });

  final int? page;
  final String? category;
  final bool? isSearch;
  final String? keyword;
  final bool isBottomScroll;
  final bool isRefresh;
  final bool isMovie;

  @override
  List<Object> get props => [];
}

class ArticleReadDetailEvent extends UserPageEvent {
  const ArticleReadDetailEvent(this.id);
  final String id;

  @override
  List<Object> get props => [id];
}

class ArticleReadHomeworldEvent extends UserPageEvent {
  const ArticleReadHomeworldEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}

class ArticleListStarshipsHorizontalEvent extends UserPageEvent {
  const ArticleListStarshipsHorizontalEvent({this.type= '', this.id = 0, this.listData = const[],this.isLast =false, });
  final String type;
  final int id;
  final List<String> listData;
  final bool isLast;

  @override
  List<Object> get props => [type];
}

class ArticleListVehiclesHorizontalEvent extends UserPageEvent {
  const ArticleListVehiclesHorizontalEvent({this.type= '', this.id = 0, this.listData = const[],this.isLast =false, });
  final String type;
  final int id;
  final List<String> listData;
  final bool isLast;

  @override
  List<Object> get props => [type];
}

class ArticleBackEvent extends UserPageEvent {
  const ArticleBackEvent();

  @override
  List<Object> get props => [];
}
