part of 'article_bloc.dart';

class ArticlePageState with FormzMixin {
  final List<ArticleModel>? listArticle;
  final ArticleDetailModel? articleDetailModel;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? type;
  final bool? isSearch;
  final bool last;
  final int page;
  final String keyword;
  final String next;

  ArticlePageState({
    this.articleDetailModel,
    this.listArticle,
    this.type,
    this.isSearch = false,
    this.submitStatus = FormzStatus.pure,
    this.errorMessage,
    this.last = false,
    this.page = 1,
    this.keyword = '',
    this.next = '',
  });

  ArticlePageState copyWith(
      {FormzStatus? submitStatus,
      ArticleDetailModel? articleDetailModel,
      List<ArticleModel>? listArticle,
      bool? isSearch,
      String? type,
      bool? last,
      int? page,
      String? keyword,
      String? next,
      String? errorMessage}) {
    return ArticlePageState(
        submitStatus: submitStatus,
        articleDetailModel: articleDetailModel ?? this.articleDetailModel,
        listArticle: listArticle ?? this.listArticle,
        isSearch: isSearch ?? this.isSearch,
        type: type,
        last: last ?? this.last,
        page: page ?? this.page,
        keyword: keyword ?? this.keyword,
        next: next ?? this.keyword,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [];

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();
}

class ArticlePageInitial extends ArticlePageState {}
