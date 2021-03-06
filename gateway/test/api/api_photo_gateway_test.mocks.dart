// Mocks generated by Mockito 5.0.16 from annotations
// in gateway/test/api/api_photo_gateway_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i10;
import 'dart:convert' as _i11;
import 'dart:typed_data' as _i12;

import 'package:dio/src/adapter.dart' as _i5;
import 'package:dio/src/cancel_token.dart' as _i15;
import 'package:dio/src/dio.dart' as _i14;
import 'package:dio/src/dio_mixin.dart' as _i7;
import 'package:dio/src/options.dart' as _i4;
import 'package:dio/src/response.dart' as _i8;
import 'package:dio/src/transformer.dart' as _i6;
import 'package:http/src/base_request.dart' as _i13;
import 'package:http/src/client.dart' as _i9;
import 'package:http/src/response.dart' as _i2;
import 'package:http/src/streamed_response.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeResponse_0 extends _i1.Fake implements _i2.Response {}

class _FakeStreamedResponse_1 extends _i1.Fake implements _i3.StreamedResponse {
}

class _FakeBaseOptions_2 extends _i1.Fake implements _i4.BaseOptions {}

class _FakeHttpClientAdapter_3 extends _i1.Fake
    implements _i5.HttpClientAdapter {}

class _FakeTransformer_4 extends _i1.Fake implements _i6.Transformer {}

class _FakeInterceptors_5 extends _i1.Fake implements _i7.Interceptors {}

class _FakeResponse_6<T> extends _i1.Fake implements _i8.Response<T> {}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i9.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.Future<_i2.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i10.Future<_i2.Response>);
  @override
  _i10.Future<_i2.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i10.Future<_i2.Response>);
  @override
  _i10.Future<_i2.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i10.Future<_i2.Response>);
  @override
  _i10.Future<_i2.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i10.Future<_i2.Response>);
  @override
  _i10.Future<_i2.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i10.Future<_i2.Response>);
  @override
  _i10.Future<_i2.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i10.Future<_i2.Response>);
  @override
  _i10.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i10.Future<String>);
  @override
  _i10.Future<_i12.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i12.Uint8List>.value(_i12.Uint8List(0)))
          as _i10.Future<_i12.Uint8List>);
  @override
  _i10.Future<_i3.StreamedResponse> send(_i13.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_1()))
          as _i10.Future<_i3.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Dio].
///
/// See the documentation for Mockito's code generation for more information.
class MockDio extends _i1.Mock implements _i14.Dio {
  MockDio() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.BaseOptions get options =>
      (super.noSuchMethod(Invocation.getter(#options),
          returnValue: _FakeBaseOptions_2()) as _i4.BaseOptions);
  @override
  set options(_i4.BaseOptions? _options) =>
      super.noSuchMethod(Invocation.setter(#options, _options),
          returnValueForMissingStub: null);
  @override
  _i5.HttpClientAdapter get httpClientAdapter =>
      (super.noSuchMethod(Invocation.getter(#httpClientAdapter),
          returnValue: _FakeHttpClientAdapter_3()) as _i5.HttpClientAdapter);
  @override
  set httpClientAdapter(_i5.HttpClientAdapter? _httpClientAdapter) => super
      .noSuchMethod(Invocation.setter(#httpClientAdapter, _httpClientAdapter),
          returnValueForMissingStub: null);
  @override
  _i6.Transformer get transformer =>
      (super.noSuchMethod(Invocation.getter(#transformer),
          returnValue: _FakeTransformer_4()) as _i6.Transformer);
  @override
  set transformer(_i6.Transformer? _transformer) =>
      super.noSuchMethod(Invocation.setter(#transformer, _transformer),
          returnValueForMissingStub: null);
  @override
  _i7.Interceptors get interceptors =>
      (super.noSuchMethod(Invocation.getter(#interceptors),
          returnValue: _FakeInterceptors_5()) as _i7.Interceptors);
  @override
  void close({bool? force = false}) =>
      super.noSuchMethod(Invocation.method(#close, [], {#force: force}),
          returnValueForMissingStub: null);
  @override
  _i10.Future<_i8.Response<T>> get<T>(String? path,
          {Map<String, dynamic>? queryParameters,
          _i4.Options? options,
          _i15.CancelToken? cancelToken,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [
                path
              ], {
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> getUri<T>(Uri? uri,
          {_i4.Options? options,
          _i15.CancelToken? cancelToken,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#getUri, [
                uri
              ], {
                #options: options,
                #cancelToken: cancelToken,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> post<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i4.Options? options,
          _i15.CancelToken? cancelToken,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> postUri<T>(Uri? uri,
          {dynamic data,
          _i4.Options? options,
          _i15.CancelToken? cancelToken,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#postUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> put<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i4.Options? options,
          _i15.CancelToken? cancelToken,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> putUri<T>(Uri? uri,
          {dynamic data,
          _i4.Options? options,
          _i15.CancelToken? cancelToken,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#putUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> head<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i4.Options? options,
          _i15.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#head, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken
              }),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> headUri<T>(Uri? uri,
          {dynamic data,
          _i4.Options? options,
          _i15.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#headUri, [uri],
                  {#data: data, #options: options, #cancelToken: cancelToken}),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> delete<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i4.Options? options,
          _i15.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken
              }),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> deleteUri<T>(Uri? uri,
          {dynamic data,
          _i4.Options? options,
          _i15.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#deleteUri, [uri],
                  {#data: data, #options: options, #cancelToken: cancelToken}),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> patch<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i4.Options? options,
          _i15.CancelToken? cancelToken,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> patchUri<T>(Uri? uri,
          {dynamic data,
          _i4.Options? options,
          _i15.CancelToken? cancelToken,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#patchUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  void lock() => super.noSuchMethod(Invocation.method(#lock, []),
      returnValueForMissingStub: null);
  @override
  void unlock() => super.noSuchMethod(Invocation.method(#unlock, []),
      returnValueForMissingStub: null);
  @override
  void clear() => super.noSuchMethod(Invocation.method(#clear, []),
      returnValueForMissingStub: null);
  @override
  _i10.Future<_i8.Response<dynamic>> download(String? urlPath, dynamic savePath,
          {_i4.ProgressCallback? onReceiveProgress,
          Map<String, dynamic>? queryParameters,
          _i15.CancelToken? cancelToken,
          bool? deleteOnError = true,
          String? lengthHeader = r'content-length',
          dynamic data,
          _i4.Options? options}) =>
      (super.noSuchMethod(
              Invocation.method(#download, [
                urlPath,
                savePath
              ], {
                #onReceiveProgress: onReceiveProgress,
                #queryParameters: queryParameters,
                #cancelToken: cancelToken,
                #deleteOnError: deleteOnError,
                #lengthHeader: lengthHeader,
                #data: data,
                #options: options
              }),
              returnValue: Future<_i8.Response<dynamic>>.value(
                  _FakeResponse_6<dynamic>()))
          as _i10.Future<_i8.Response<dynamic>>);
  @override
  _i10.Future<_i8.Response<dynamic>> downloadUri(Uri? uri, dynamic savePath,
          {_i4.ProgressCallback? onReceiveProgress,
          _i15.CancelToken? cancelToken,
          bool? deleteOnError = true,
          String? lengthHeader = r'content-length',
          dynamic data,
          _i4.Options? options}) =>
      (super.noSuchMethod(
              Invocation.method(#downloadUri, [
                uri,
                savePath
              ], {
                #onReceiveProgress: onReceiveProgress,
                #cancelToken: cancelToken,
                #deleteOnError: deleteOnError,
                #lengthHeader: lengthHeader,
                #data: data,
                #options: options
              }),
              returnValue: Future<_i8.Response<dynamic>>.value(
                  _FakeResponse_6<dynamic>()))
          as _i10.Future<_i8.Response<dynamic>>);
  @override
  _i10.Future<_i8.Response<T>> request<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i15.CancelToken? cancelToken,
          _i4.Options? options,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#request, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #cancelToken: cancelToken,
                #options: options,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> requestUri<T>(Uri? uri,
          {dynamic data,
          _i15.CancelToken? cancelToken,
          _i4.Options? options,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#requestUri, [
                uri
              ], {
                #data: data,
                #cancelToken: cancelToken,
                #options: options,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  _i10.Future<_i8.Response<T>> fetch<T>(_i4.RequestOptions? requestOptions) =>
      (super.noSuchMethod(Invocation.method(#fetch, [requestOptions]),
              returnValue: Future<_i8.Response<T>>.value(_FakeResponse_6<T>()))
          as _i10.Future<_i8.Response<T>>);
  @override
  String toString() => super.toString();
}
