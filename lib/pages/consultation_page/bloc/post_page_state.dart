part of 'post_page_bloc.dart';

class PostPageState extends Equatable with FormzMixin {
  final List<PostModel>? listArticle;
  final PostModel? articleDetailModel;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? type;
  final bool? isSearch;
  final bool? isFilter;
  final String? tag;
  final bool isLast;
  final int page;
  final String keyword;
  final String next;

  PostPageState({
    this.articleDetailModel,
    this.listArticle,
    this.type,
    this.isSearch = false,
    this.submitStatus = FormzStatus.pure,
    this.errorMessage,
    this.isFilter = false,
    this.tag,
    this.isLast = false,
    this.page = 1,
    this.keyword = '',
    this.next = '',
  });

  PostPageState copyWith(
      {FormzStatus? submitStatus,
      PostModel? articleDetailModel,
      List<PostModel>? listArticle,
      bool? isSearch,
      String? type,
      bool? isLast,
      bool? isFilter,
      String? tag,
      int? page,
      String? keyword,
      String? next,
      String? errorMessage}) {
    return PostPageState(
        submitStatus: submitStatus,
        articleDetailModel: articleDetailModel ?? this.articleDetailModel,
        listArticle: listArticle ?? this.listArticle,
        isSearch: isSearch ?? this.isSearch,
        type: type,
        isLast: isLast ?? this.isLast,
        page: page ?? this.page,
        keyword: keyword ?? this.keyword,
        isFilter: isFilter ?? this.isFilter,
        tag: tag ?? this.tag,
        next: next ?? this.keyword,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [
        submitStatus ?? '',
        listArticle ?? [],
        articleDetailModel ?? PeopleModel(),
        type ?? '',
        page,
        isLast,
        next
      ];

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();
}

class ArticlePageInitial extends PostPageState {}
