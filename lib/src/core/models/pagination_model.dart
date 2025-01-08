class PaginationModel {
  final int perPage;
  final int currentPage;
  final int firstPage;
  final int lastPage;
  final int total;

  // final int from;
  // final int to;

  // final String? firstPageUrl;
  // final String? nextPageUrl;
  // final String? lastPageUrl;
  // final String? prevPageUrl;
  // final String? path;

  PaginationModel({
    required this.perPage,
    required this.currentPage,
    this.firstPage = 1,
    required this.lastPage,
    required this.total,
  });

  PaginationModel copyWith({
    int? perPage,
    int? currentPage,
    int? firstPage,
    int? lastPage,
    int? total,
  }) {
    return PaginationModel(
      perPage: perPage ?? this.perPage,
      currentPage: currentPage ?? this.currentPage,
      firstPage: firstPage ?? this.firstPage,
      lastPage: lastPage ?? this.lastPage,
      total: total ?? this.total,
    );
  }
}
