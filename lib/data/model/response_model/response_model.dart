
class ResponseModel<T> {
  int? count;
  String? next;
  String? previous;
  dynamic data;
  String? action;
  int? total;
  int? perPage;
  int? page;
  int? currentPage;
  int? lastPage;
  int? from;
  int? to;
  int? limit;

  ResponseModel({
    this.count,
    this.next,
    this.previous,
    this.data,
    this.action,
    this.total,
    this.perPage,
    this.page,
    this.currentPage,
    this.lastPage,
    this.from,
    this.to,
    this.limit,
  });

  ResponseModel.fromJson(Map<String, dynamic> json, T fromJson(Map<String, dynamic> json)) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    action = json['action'];

    if (json["data"] != null && fromJson != null) {
      if (json['data'].toString()[0] == "[") {
        data = List<T>.from(json['data'].map((x) => fromJson(x)));
      } else {
        data = fromJson(json['data']);
      }
    }

    total = json['total'];
    perPage = json['per_page'];
    page = json['page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    from = json['from'];
    to = json['to'];
    limit = json['limit'];

  }

  ResponseModel<T> copyWith({
    int? nextcount,
    String? nextprevious,
    String? errorprevious,
    String? action,
    dynamic data,
    int? total,
    int? perPage,
    int? page,
    int? currentPage,
    int? lastPage,
    int? from,
    int? to,
    int? limit,
    List<T>? result,
  }) {
    return ResponseModel<T>(
      count: nextcount ?? this.count,
      next: nextprevious ?? this.next,
      previous: errorprevious ?? this.previous,
      action: action ?? this.action,
      data: data ?? this.data,
      total: total ?? this.total,
      perPage: perPage ?? this.perPage,
      page: page ?? this.page,
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      from: from ?? this.from,
      to: to ?? this.to,
      limit: limit ?? this.limit,
    );
  }

  static void empty(Map<String, dynamic> json) {
    return;
  }

  static ResponseModel resultsEmpty({dynamic results}) {
    return ResponseModel(
     count: 0,
      next: '',
      previous: '',
      data: results,
      action: '',
      page: 0,
      limit: 0,
    );
  }

  static ResponseModel resultsTimeOut({dynamic results}) {
    return ResponseModel(
      count: 0,
      next: '',
      previous: '',
      data: 'timeout',
      action: '',
      page: 0,
      limit: 0,
    );
  }
}
