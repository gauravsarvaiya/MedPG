// import 'dart:io';
// import 'dart:async';
// import 'dart:developer';
// import 'package:cookie_jar/cookie_jar.dart';
// import 'package:dio/dio.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:medpg/app/auth/view_model/auth_provider.dart';
// import 'package:medpg/utils/services/secure_storage.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/foundation.dart';
//
//
//
// class WebService {
//   WebService();
//
//   WebService._internal() {
//     _dio.interceptors.add(CookieManager(_cookieJar)); // ✅ Add interceptor once
//   }
//
//   static final WebService _instance = WebService._internal();
//
//   static WebService get instance => _instance;
//   final _dio = Dio();
//   final CookieJar _cookieJar = CookieJar();
//
//   SecureStorage secureStorage = SecureStorage();
//
//   get({required NetworkRequest request}) async {
//
//     if (kDebugMode) {
//       log(request.toString());
//     }
//
//     final token = SecureStorage.token;
//
//     print("=====token GET ==== $token");
//
//     try {
//       Response response = await _dio
//           .get(request.url,
//           queryParameters: request.queryParameters,
//           data: request.data,
//           options:Options(
//           headers: {
//           "x-csrf-token": "$token"
//         }
//       )).timeout(const Duration(seconds: 60));
//
//       if (kDebugMode) {
//         log(request.toResponseString(response.data,));
//         log(request.toResponseString(response.headers));
//         log(request.toResponseString(response.extra));
//       }
//
//       return response.data;
//     } on DioError catch (e) {
//       decodeErrorResponse(error: e, request: request);
//     } on SocketException {
//       throw "Internet connection not available";
//     } catch (e) {
//
//       if(e is TimeoutException) {
//         throw "Request TimeOut.";
//       }
//
//       rethrow;
//     }
//   }
//
//   post({required NetworkRequest request}) async {
//     if (kDebugMode) {
//       log(request.toString());
//     }
//
//     final token = SecureStorage.token;
//
//     print("=====token POST ==== $token");
//     try {
//       Response response = await _dio
//           .post(request.url,queryParameters: request.queryParameters, data: request.data, options:Options(
//               headers: {
//                 "x-csrf-token": "$token"
//               })).timeout(const Duration(seconds: 60));
//
//               print("my associationID is ${SecureStorage.userID}");
//
//               print("my token is ${SecureStorage.token} ======");
//       if (kDebugMode) {
//         log(request.toResponseString(response.data));
//       }
//       return response.data;
//     } on DioException catch (e) {
//       decodeErrorResponse(error: e, request: request);
//     } on SocketException {
//       throw "Internet connection not available";
//     } catch (e) {
//
//       if(e is TimeoutException) {
//         throw "Request TimeOut.";
//       }
//
//       rethrow;
//     }
//   }
//
//   Future<File> fileFromImageUrl(String? image) async {
//     Dio dio = Dio();
//     final response = await dio.get(image ?? "",
//         options: Options(responseType: ResponseType.bytes));
//
//     final documentDirectory = await getApplicationDocumentsDirectory();
//
//     final imageData = image?.split("/").last;
//
//     final file = File(join(documentDirectory.path, imageData));
//
//     await file.writeAsBytes(response.data);
//
//     return file;
//   }
//
//   put({required NetworkRequest request}) async {
//     if (kDebugMode) {
//       log(request.toString());
//     }
//
//     try {
//       Response response = await _dio
//           .put(request.url,queryParameters: request.queryParameters,data: request.data, options:Options(
//           headers: {
//             "x-csrf-token": "${SecureStorage.token}"
//           })).timeout(const Duration(seconds: 60));
//
//       print("my associationID is ${SecureStorage.userID}");
//
//       print("my token is ${SecureStorage.token} ======");
//       if (kDebugMode) {
//         log(request.toResponseString(response.data));
//       }
//       return response.data;
//     } on DioException catch (e) {
//       decodeErrorResponse(error: e, request: request);
//     } on SocketException {
//       throw "Internet connection not available";
//     } catch (e) {
//
//       if(e is TimeoutException) {
//         throw "Request TimeOut.";
//       }
//
//       rethrow;
//     }
//   }
//
//   delete({required NetworkRequest request}) async {
//     if (kDebugMode) {
//       log(request.toString());
//     }
//
//     try {
//       Response response = await _dio
//           .delete(request.url, queryParameters: request.queryParameters,
//           data: request.data,
//           options:Options(
//           headers: {
//             "x-csrf-token": "${SecureStorage.token}"
//           }
//       )).timeout(const Duration(seconds: 60));
//
//
//       if (kDebugMode) {
//         log(request.toResponseString(response.data));
//       }
//
//       return response.data;
//     } on DioError catch (e) {
//       decodeErrorResponse(error: e, request: request);
//     } on SocketException {
//       throw "Internet connection not available";
//     } catch (e) {
//
//       if(e is TimeoutException) {
//         throw "Request TimeOut.";
//       }
//
//       rethrow;
//     }
//   }
//
//   decodeErrorResponse({required DioException error, required NetworkRequest request}) {
//
//     if(error.response?.statusCode == 401) {
//       throw UnauthorisedException();
//     }
//
//     if (kDebugMode) {
//       log(request.toErrorString(error));
//     }
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//         throw 'Connection timeOut';
//         case DioExceptionType.sendTimeout:
//         // TODO: Handle this case.
//         break;
//       case DioExceptionType.receiveTimeout:
//         throw 'Connection timeOut';
//       case DioExceptionType.badCertificate:
//         throw 'Connection timeOut';
//       case DioExceptionType.badResponse:
//         throw 'Something went wrong.';
//       case DioExceptionType.cancel:
//         throw 'Request Canceled by user';
//       case DioExceptionType.connectionError:
//         throw 'Something went wrong.';
//       case DioExceptionType.unknown:
//
//         if((error.message ?? "").contains("SocketException") || (error.error) is SocketException){
//           throw "Internet connection not available";
//         } else {
//           throw "Something went wrong.";
//         }
//
//     }
//   }
// }
//
// class NetworkRequest {
//   final String url;
//   final Map<String, dynamic>? queryParameters;
//   final dynamic data;
//   NetworkRequest({required this.url, this.queryParameters, this.data});
//
//   String toErrorString(DioException error) {
//     try {
//
//       final uri = Uri.parse(url);
//
//       final log = '''===⚠️ START ERROR ⚠️===
//
//       API is for ${uri.pathSegments.last}
//       URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
//       Data = ${getFormData()}
//       Code = ${error.response?.statusCode}
//       Error:
//         Error Response is for this ${error.response?.toString()}
//         Error = ${error.error?.toString()} - ${error.response?.statusCode}
//
// ===⚠️ END ERROR ⚠️===''';
//
//       return log;
//     } catch (e) {
//       return '''===⚠️ START ERROR ⚠️===
//
//       URL = $url
//       Data = ${getFormData()}
//       Error:
//         Error Response is for this ${error.response?.toString()}
//         Error = ${error.error?.toString()} - ${error.response?.statusCode}
//
// ===⚠️ END ERROR ⚠️===''';
//     }
//   }
//
//   String toResponseString(dynamic response) {
//     try {
//       final uri = Uri.parse(url);
//
//       final log = '''===👍️ START RESPONSE 👍===
//
//       API is for ${uri.pathSegments.last}
//       URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
//       Data = ${getFormData()}
//       header data =
//       Response:
//         $response
//
// ===👍️ END RESPONSE 👍===''';
//
//       return log;
//     } catch (e) {
//       return '''===👍️ START RESPONSE 👍===
//
//       URL = $url
//       Data = ${getFormData()}
//       Response:
//         $response
//
// ===👍️ END RESPONSE 👍===
//       ''';
//     }
//   }
//
//   dynamic getFormData() {
//     if(data is FormData) {
//       final formData = data as FormData;
//       return formData.fields;
//     } else {
//       return data;
//     }
//   }
//
//   @override
//   toString() {
//     try {
//       final uri = Uri.parse(url);
//
//       final log = '''===🌐 START REQUEST 🌐===
//
//       API is for ${uri.pathSegments.last}
//       URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
//       Data = ${getFormData()}
//
//       ===🌐 END REQUEST 🌐===''';
//
//       return log;
//     } catch (e) {
//       return "API is for $url\nQuery = $queryParameters\n Data = $data";
//     }
//   }
// }
//
// class UnauthorisedException implements Exception {
//
// }


// ✅ Final fixed WebService with CookieManager and CSRF token handling

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:medpg/utils/services/secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';

class WebService {
  WebService._internal();

  static final WebService _instance = WebService._internal();
  static WebService get instance => _instance;

  final Dio _dio = Dio();
  late final CookieJar _cookieJar;
  final SecureStorage secureStorage = SecureStorage();

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _cookieJar = PersistCookieJar(storage: FileStorage(join(dir.path, ".cookies")));
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  Future<dynamic> get({required NetworkRequest request}) async {
    await _ensureValidToken();
    final token = await secureStorage.getToken();
    log("===== CSRF token GET ==== $token");

    try {
      final response = await _dio.get(
        request.url,
        queryParameters: request.queryParameters,
        options: Options(headers: {"x-csrf-token": token}),
      );
      _logResponse(request, response);
      return response.data;
    } on DioException catch (e) {
      decodeErrorResponse(error: e, request: request);
    }
  }

  Future<dynamic> post({required NetworkRequest request}) async {
    await _ensureValidToken();
    final token = await secureStorage.getToken();
    log("===== CSRF token POST ==== $token");

    try {
      final response = await _dio.post(
        request.url,
        queryParameters: request.queryParameters,
        data: request.data,
        options: Options(headers: {"x-csrf-token": token}),
      );
      _logResponse(request, response);
      return response.data;
    } on DioException catch (e) {
      decodeErrorResponse(error: e, request: request);
    }
  }

  Future<void> _ensureValidToken() async {
    final expiry = await secureStorage.getTokenExpiry();
    final now = DateTime.now().millisecondsSinceEpoch;
    if (expiry == null || now > expiry) {
      final res = await _dio.get("https://themedico.app/api/csrf-token");
      final newToken = res.data['csrfToken'];
      final expiresAt = res.data['expiresAt'];
      await secureStorage.setToken(token: newToken);
      await secureStorage.setTokenExpiry(expiresAt: expiresAt);
    }
  }

  void _logResponse(NetworkRequest request, Response response) {
    if (kDebugMode) {
      log(request.toResponseString(response.data));
    }
  }

  void decodeErrorResponse({required DioException error, required NetworkRequest request}) {
    final statusCode = error.response?.statusCode;
    final responseData = error.response?.data;

    // Try to extract custom error message from server
    String message = "Something went wrong.";
    if (responseData is Map<String, dynamic> && responseData.containsKey("error")) {
      message = responseData["error"].toString();
    }

    // Handle specific status codes
    if (statusCode == 401) {
      throw message; // ✅ Throws "Invalid credentials"
    }

    log(request.toErrorString(error));
    throw message;
  }

}

class NetworkRequest {
  final String url;
  final Map<String, dynamic>? queryParameters;
  final dynamic data;
  NetworkRequest({required this.url, this.queryParameters, this.data});

  String toErrorString(DioException error) {
    try {

      final uri = Uri.parse(url);

      final log = '''===⚠️ START ERROR ⚠️===

      API is for ${uri.pathSegments.last}
      URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
      Data = ${getFormData()}
      Code = ${error.response?.statusCode}
      Error:
        Error Response is for this ${error.response?.toString()}
        Error = ${error.error?.toString()} - ${error.response?.statusCode}

===⚠️ END ERROR ⚠️===''';

      return log;
    } catch (e) {
      return '''===⚠️ START ERROR ⚠️===

      URL = $url
      Data = ${getFormData()}
      Error:
        Error Response is for this ${error.response?.toString()}
        Error = ${error.error?.toString()} - ${error.response?.statusCode}

===⚠️ END ERROR ⚠️===''';
    }
  }

  String toResponseString(dynamic response) {
    try {
      final uri = Uri.parse(url);

      final log = '''===👍️ START RESPONSE 👍===

      API is for ${uri.pathSegments.last}
      URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
      Data = ${getFormData()}
      header data =
      Response:
        $response

===👍️ END RESPONSE 👍===''';

      return log;
    } catch (e) {
      return '''===👍️ START RESPONSE 👍===

      URL = $url
      Data = ${getFormData()}
      Response:
        $response

===👍️ END RESPONSE 👍===
      ''';
    }
  }

  dynamic getFormData() {
    if(data is FormData) {
      final formData = data as FormData;
      return formData.fields;
    } else {
      return data;
    }
  }

  @override
  toString() {
    try {
      final uri = Uri.parse(url);

      final log = '''===🌐 START REQUEST 🌐===

      API is for ${uri.pathSegments.last}
      URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
      Data = ${getFormData()}

      ===🌐 END REQUEST 🌐===''';

      return log;
    } catch (e) {
      return "API is for $url\nQuery = $queryParameters\n Data = $data";
    }
  }
}

class UnauthorisedException implements Exception {
  @override
  String toString() => 'UnauthorisedException';
}