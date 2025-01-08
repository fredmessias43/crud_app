import 'package:crud_app/src/core/models/pagination_model.dart';

class RepositoryResponse<T> {
  final T? data;
  final Error? error;
  final PaginationModel? pagination;
  RepositoryResponse({
    this.data,
    this.error,
    this.pagination,
  });

  RepositoryResponse<T> copyWith({
    T? data,
    Error? error,
    PaginationModel? pagination,
  }) {
    return RepositoryResponse<T>(
      data: data ?? this.data,
      error: error ?? this.error,
      pagination: pagination ?? this.pagination,
    );
  }
}
