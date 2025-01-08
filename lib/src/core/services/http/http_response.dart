class HttpResponse {
  final int status;
  final dynamic data;
  final bool isSuccessful;
  final dynamic response;
  final Error? error;

  const HttpResponse({
    required this.status,
    required this.data,
    required this.isSuccessful,
    this.response,
    this.error,
  });
}
