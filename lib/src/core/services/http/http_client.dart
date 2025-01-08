import 'dart:developer';
import 'package:crud_app/src/core/services/http/http_response.dart';
import 'package:uno/uno.dart';

class HttpClient {
  final baseUrl = "/";
  Map<String, String> baseHeaders = {};
  final baseTimeout = const Duration(seconds: 1);
  var authorizationToken = "";

  Future<HttpClient> withToken(dynamic tokenCall) async {
    if (tokenCall.runtimeType == Function) {
      authorizationToken = await tokenCall();
    } else if (tokenCall.runtimeType == String) {
      authorizationToken = tokenCall;
    }

    baseHeaders.addAll({"Authorization": authorizationToken});

    return this;
  }

  Future<HttpResponse> request({
    required String method,
    required String url,
    Map<String, String>? params,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final uno = Uno(baseURL: baseUrl, headers: baseHeaders, timeout: baseTimeout);

    try {
      log("init $method:$url");

      final result = await uno.request(
        Request(
          uri: Uri.parse(uno.baseURL + url),
          method: method,
          headers: headers ?? {},
          timeout: baseTimeout,
        ),
      );
      log("finish $method:$url - TRUE");

      return HttpResponse(
        status: result.status,
        data: result.data,
        isSuccessful: result.status <= 299,
        response: result,
      );
    } catch (e) {
      log("finish $method:$url - FALSE");
      return HttpResponse(
        status: 500,
        data: null,
        isSuccessful: false,
        error: e as Error,
      );
    }
  }

  Future<HttpResponse> get(
    String url, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    return await request(
      method: "get",
      url: url,
      params: params as Map<String, String>,
      headers: headers as Map<String, String>,
    );
  }

  Future<HttpResponse> post(
    String url, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    return await request(
      method: "post",
      url: url,
      params: params as Map<String, String>,
      headers: headers as Map<String, String>,
      body: body,
    );
  }

  Future<HttpResponse> put(
    String url, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    return await request(
      method: "put",
      url: url,
      params: params as Map<String, String>,
      headers: headers as Map<String, String>,
      body: body,
    );
  }

  Future<HttpResponse> patch(
    String url, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    return await request(
      method: "patch",
      url: url,
      params: params as Map<String, String>,
      headers: headers as Map<String, String>,
      body: body,
    );
  }

  Future<HttpResponse> delete(
    String url, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    return await request(
      method: "delete",
      url: url,
      params: params as Map<String, String>,
      headers: headers as Map<String, String>,
      body: body,
    );
  }
}
