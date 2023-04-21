import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../utils/shared_preference/app_shared_preference.dart';
import '../../configurations/configurations.dart';
import '../http_constants.dart';
import 'http_util.dart';

class HttpClient {
  Client? _client;
  String? host = Configurations.host;
  String? token = '';
  String? refreshToken = '';
  Map<String, String>? header;
  bool cookieFromSp = true;
  bool isRefresh = false;

  HttpClient() {
    _client = Client();
    // todo delete hardcoded token
    header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    host = Configurations.host;
    cookieFromSp = true;
    isRefresh = false;
  }

  Uri _getParsedUrl(String path, {Map<String, String>? queryParameters}) {
    String h = host!;
    String _subHost = Configurations.subHost + "/";
    String finalPath = _subHost + path;
    if (h.contains("//")) {
      h = h.split("//")[1];
    }

    if (h.contains("/")) {
      h = h.replaceAll("/", "");
    }
    var data =  Uri.https(h, finalPath, queryParameters);
    return data;
  }

  Future<Response?> getAccess(String path,
      {Map<String, String>? queryParameters}) async {
    late Response response;

      response = await _client!
          .get(
            _getParsedUrl(path, queryParameters: queryParameters),
            headers: header,
          )
          .timeout(Duration(minutes: 2));

    return response;
  }

  dynamic get(String path, {Map<String, String>? queryParameters}) async {
    debugPrint('>>>>>>> [GET] ${_getParsedUrl(path)}');
    // token = await getToken();
    // header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    // String? cookie =
    //     await AppSharedPreference.getString(AppSharedPreference.cookie);
    // print('cookie : $cookie');
    // if (cookie != null) {
    //   setCookieFromSession(cookie);
    // }

    // TODO DO NOT USE THIS STATIC TOKEN FOR PROD
    // header![HttpHeaders.authorizationHeader] = AppConstants.token;

    Response? response =
        await getAccess(path, queryParameters: queryParameters);
    var responseData = HttpUtil.getResponse(response ?? Response('', 0));

    return responseData;
  }

  Future<Response?> downloadAccess(String path) async {
    late Response response;

      response = await _client!.get(
        _getParsedUrl(path),
        headers: header,
      );


    return response;
  }

  Future<Response?> downloadFile(String path) async {
    Response? response = await downloadAccess(path);
    return response?.statusCode == 201 ? response : null;
  }

  dynamic postAccess(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    final Map<String, String>? requestHeader = overrideHeader ?? header;
    late Response response;

      response = await _client!.post(
        _getParsedUrl(path),
        body: HttpUtil.encodeRequestBody(
            json.encode(data), requestHeader![HttpConstants.contentType]!),
        headers: requestHeader,
      );
      updateCookie(response);


    return response;
  }

  dynamic post(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    debugPrint('>>>>>>> [POST] ${_getParsedUrl(path)}');
    debugPrint('>>>>>>> [HEADER] ${header.toString()}');
    debugPrint('>>>>>>> [DATA] ${json.encode(data).toString()}');

    token = await getToken();

    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    String? cookie =
        await AppSharedPreference.getString(AppSharedPreference.cookie);
    if (cookie != null) {
      setCookieFromSession(cookie);
    }
    header![HttpHeaders.authorizationHeader] = 'Bearer $token';
    // TODO REMOVE THIS JUST FOR DEV PURPOSE
    // header![HttpHeaders.authorizationHeader] = AppConstants.token;

    // todo fix refresh token
    Response? response = await postAccess(path, data, overrideHeader: overrideHeader);
    var responseData = HttpUtil.getResponse(response ?? Response('', 0));

    return responseData;
  }

  dynamic postLogin(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    debugPrint('>>>>>>> [POST] ${_getParsedUrl(path)}');
    debugPrint('>>>>>>> [HEADER] ${header.toString()}');
    debugPrint('>>>>>>> [DATA] ${json.encode(data).toString()}');

    token = await getToken();

    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    String? cookie =
        await AppSharedPreference.getString(AppSharedPreference.cookie);
    if (cookie != null) {
      setCookieFromSession(cookie);
    }
    // TODO REMOVE THIS JUST FOR DEV PURPOSE
    // header![HttpHeaders.authorizationHeader] = AppConstants.token;

    // todo fix refresh token
    Response? response =
        await postAccess(path, data, overrideHeader: overrideHeader);
    var responseData = HttpUtil.getResponse(response ?? Response('', 0));
    return responseData;
  }

  dynamic deleteAccess(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    final Map<String, String>? requestHeader = overrideHeader ?? header;
    late Response response;

      response = await _client!.delete(
        _getParsedUrl(path),
        body: HttpUtil.encodeRequestBody(
            json.encode(data), requestHeader![HttpConstants.contentType]!),
        headers: requestHeader,
      );

    return response;
  }

  dynamic delete(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    debugPrint('>>>>>>> [POST] ${_getParsedUrl(path)}');
    debugPrint('>>>>>>> [HEADER] ${header.toString()}');
    debugPrint('>>>>>>> [DATA] ${json.encode(data).toString()}');

    token = await getToken();
    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    // TODO REMOVE THIS JUST FOR DEV PURPOSE
    // header![HttpHeaders.authorizationHeader] = AppConstants.token;
    Response? response =
        await deleteAccess(path, data, overrideHeader: overrideHeader);
    var responseData = HttpUtil.getResponse(response ?? Response('', 0));


    return responseData;
  }

  dynamic putAccess(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    final Map<String, String>? requestHeader = overrideHeader ?? header;
    late Response response;

      response = await _client!
          .put(
            _getParsedUrl(path),
            body: HttpUtil.encodeRequestBody(
                json.encode(data), requestHeader![HttpConstants.contentType]!),
            headers: requestHeader,
          );

      response = await _client!.put(
        _getParsedUrl(path),
        body: HttpUtil.encodeRequestBody(
            json.encode(data), requestHeader[HttpConstants.contentType]!),
        headers: requestHeader,
      );

    return response;
  }

  dynamic put(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    debugPrint('>>>>>>> [POST] ${_getParsedUrl(path)}');
    debugPrint('>>>>>>> [HEADER] ${header.toString()}');
    debugPrint('>>>>>>> [DATA] ${data.toString()}');

    token = await getToken();

    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    String? cookie =
        await AppSharedPreference.getString(AppSharedPreference.cookie);
    if (cookie != null) {
      setCookieFromSession(cookie);
    }

    Response? response =
        await putAccess(path, data, overrideHeader: overrideHeader);
    var responseData = HttpUtil.getResponse(response ?? Response('', 0));

    return responseData;
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(AppSharedPreference.token);
    if (userString == null) return null;
    return userString;
  }

  void updateCookie(Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      AppSharedPreference.setString(AppSharedPreference.cookie, rawCookie);
      int index = rawCookie.indexOf(';');
      header!['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

  void setCookieFromSession(String cookie) {
    int index = cookie.indexOf(';');
    header!['cookie'] = (index == -1) ? cookie : cookie.substring(0, index);
  }
}
