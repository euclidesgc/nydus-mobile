import 'dart:developer';

import 'package:client_http/src/client_http/client_http.dart';
import 'package:client_http/src/errors/errors.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ClientHttpDioImpl implements ClientHttp {
  final List<Interceptor>? interceptors;
  final String? baseUrl;

  ClientHttpDioImpl({
    this.interceptors,
    this.baseUrl = const String.fromEnvironment('BASE_URL'),
  });

  @override
  Future<ClientResponse> request({
    required String url,
    required HttpVerb verb,
    Map<String, dynamic>? queryParams,
    body,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    Dio dio = DioForNative(BaseOptions(baseUrl: baseUrl ?? ''));

    if (interceptors != null && interceptors!.isNotEmpty) {
      dio.interceptors.addAll(interceptors!);
    }

    final defaultHeaders = headers?.cast<String, dynamic>() ?? {}
      ..addAll(_getDefaultHeaders());

    final defaultOptions = options ??
        Options(
          headers: defaultHeaders,
        );

    late Response response;

    try {
      switch (verb) {
        case HttpVerb.GET:
          response = await dio.get(
            url,
            queryParameters: queryParams,
            options: defaultOptions,
          );
          break;
        case HttpVerb.POST:
          response = await dio.post(
            url,
            data: body,
            options: defaultOptions,
          );
          break;
        case HttpVerb.PUT:
          response = await dio.put(
            url,
            data: body,
            options: defaultOptions,
          );
          break;
        case HttpVerb.PATCH:
          response = await dio.patch(
            url,
            data: body,
            options: defaultOptions,
          );
          break;
        case HttpVerb.DELETE:
          response = await dio.delete(
            url,
            data: body,
            options: defaultOptions,
          );
          break;
        default:
          throw ClientHttpRequestTypeError(message: 'Invalid verb');
      }
    } on DioError catch (error) {
      if (error.response != null) {
        final statusCode = error.response!.statusCode;
        final message = error.response!.statusMessage;
        final path = error.response!.requestOptions.path;
        log('🔴 Error: StatusCode - $statusCode - Path: $path');

        switch (error.response!.statusCode) {
          case 400:
            throw BadRequestError(message: message);
          case 401:
            throw UnauthorizedError(message: message);
          case 403:
            throw ForbiddenError(message: message);
          case 404:
            throw NotFoundError(message: message);
          case 422:
            throw UnprocessableEntityError(message: message);
          case 500:
            throw ServerError(message: message);
          default:
            throw UnexpectedError(message: message);
        }
      } else {
        throw UnexpectedError(message: error.message);
      }
    } catch (error, stack) {
      log(
        '🔴 Error - Client Http Request Error',
        error: error,
        stackTrace: stack,
      );

      throw ClientHttpRequetError(verb.name);
    }
    return _handleResponse(response);
  }

  ClientResponse _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        log('✅ ${response.realUri} - StatusCode: ${response.statusCode}');
        return ClientResponse(
          statusCode: response.statusCode!,
          data: response.data,
          header: response.headers.isEmpty
              ? null
              : Map<String, dynamic>.from(response.headers.map),
        );
      case 204:
        log('✅ ${response.realUri} - StatusCode: ${response.statusCode}');
        return ClientResponse(
          statusCode: response.statusCode!,
          data: null,
          header: response.headers.isEmpty
              ? null
              : Map<String, dynamic>.from(response.headers.map),
        );
      default:
        log('🔴 Error - Unexpected ERROR - StatusCode: ${response.statusCode}');
        throw UnexpectedError(message: response.requestOptions.path);
    }
  }

  static Map<String, String> _getDefaultHeaders() {
    return {
      "accept": "application/json, text/plain, */*",
      "content-type": "application/json",
    };
  }
}
