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

    // final Object? jsonBody = body is Map ? body : body?.toJson();

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
        switch (error.response!.statusCode) {
          case 400:
            log('🔴 Error - ${error.response!.statusCode}');
            throw BadRequestError(message: response.requestOptions.path);
          case 401:
            log('🔴 Error - ${error.response!.statusCode}');
            throw UnauthorizedError(message: response.requestOptions.path);
          case 403:
            log('🔴 Error - ${error.response!.statusCode}');
            throw ForbiddenError(message: response.requestOptions.path);
          case 404:
            log('🔴 Error - ${error.response!.statusCode}');
            throw NotFoundError(message: response.requestOptions.path);
          case 422:
            log('🔴 Error - ${error.response!.statusCode}');
            throw UnprocessableEntityError(
                message: response.requestOptions.path);
          case 500:
            log('🔴 Error - ${error.response!.statusCode}');
            throw ServerError(message: response.requestOptions.path);
          default:
            log('🔴 Error - Unexpected ERROR - ${error.response!.statusCode}');
            throw UnexpectedError(message: response.requestOptions.path);
        }
      } else {
        log('🔴 Error - Unexpected ERROR - $error');
        throw UnexpectedError(message: error.toString());
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
