part of 'post_page_bloc.dart';

@immutable
abstract class PostPageEvent extends Equatable {
  const PostPageEvent();

  @override
  List<Object> get props => [];
}

enum SortEnum { asc, desc }

class PostFetchEvent extends PostPageEvent {
  const PostFetchEvent({
    this.page = 0,
    this.isBottomScroll = false,
    this.category = '',
    this.isSearch = false,
    this.isFilter = false,
    this.isRefresh = false,
    this.isFromUser = false,
    this.isMovie = true,
    this.tag = '',
    this.keyword = '',
    this.id = '',
  });

  final int? page;
  final String? category;
  final bool? isSearch;
  final bool? isFilter;
  final String? tag;
  final String? keyword;
  final String? id;
  final bool isBottomScroll;
  final bool isRefresh;
  final bool isMovie;
  final bool isFromUser;

  @override
  List<Object> get props => [];
}


class ArticleReadHomeworldEvent extends PostPageEvent {
  const ArticleReadHomeworldEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}

class ArticleListStarshipsHorizontalEvent extends PostPageEvent {
  const ArticleListStarshipsHorizontalEvent({this.type= '', this.id = 0, this.listData = const[],this.isLast =false, });
  final String type;
  final int id;
  final List<String> listData;
  final bool isLast;

  @override
  List<Object> get props => [type];
}

class ArticleListVehiclesHorizontalEvent extends PostPageEvent {
  const ArticleListVehiclesHorizontalEvent({this.type= '', this.id = 0, this.listData = const[],this.isLast =false, });
  final String type;
  final int id;
  final List<String> listData;
  final bool isLast;

  @override
  List<Object> get props => [type];
}

class ArticleBackEvent extends PostPageEvent {
  const ArticleBackEvent();

  @override
  List<Object> get props => [];
}
