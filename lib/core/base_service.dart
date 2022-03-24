import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:see_blogs_app/core/i_base_model.dart';
import 'package:see_blogs_app/environment.dart';

class BaseService<T> {
  static Future<dynamic> get<T extends IBaseModel>({
    required IBaseModel modelData,
    required String path,
    int? id,
  }) async {
    String uri = Environment.baseUri + path + id.toString();
    String uri1 = Environment.baseUri + path;

    var response = await http.get(Uri.parse(id == null ? uri1 : uri),
        headers: Environment.apiHeader);

    switch (response.statusCode) {
      case HttpStatus.ok:
        var result = jsonBodyParser<T>(modelData, response.body);
        return result;

      case HttpStatus.badRequest:
        return response;
      case HttpStatus.badGateway:
        return response;

      default:
        return response;
    }
  }

  static Future<http.Response> post<T extends IBaseModel>(
      {required String path, IBaseModel? model}) async {
    String uri = Environment.baseUri + path;

    var toJson = jsonEncode(model?.toJson());

    var response = await http.post(Uri.parse(uri),
        body: toJson, headers: Environment.apiHeader);
    print(toJson);
    switch (response.statusCode) {
      case HttpStatus.ok:
        return response;

      case HttpStatus.badRequest:
        return response;
      case HttpStatus.badGateway:
        return response;

      default:
        return response;
    }
  }

  static Future<dynamic> put(
      {required String path,
      required int id,
      required IBaseModel model}) async {
    var toJson = jsonEncode(model.toJson());
    String uri = Environment.baseUri + path + id.toString();
    print(toJson);

    var response = await http.put(Uri.parse(uri),
        body: toJson, headers: Environment.apiHeader);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return response;
      case HttpStatus.badRequest:
        return response;
      case HttpStatus.badGateway:
        return response;

      default:
        return response;
    }
  }

  static Future<dynamic> delete({
    required int id,
    required String path,
  }) async {
    String uri = Environment.baseUri + path + id.toString();
    var response =
        await http.delete(Uri.parse(uri), headers: Environment.apiHeader);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return response;

      case HttpStatus.badRequest:
        return response;

      case HttpStatus.badGateway:
        return response;

      default:
        return response;
    }
  }

  static dynamic jsonBodyParser<T>(IBaseModel model, String body) {
    var jsonBody = jsonDecode(body);

    if (jsonBody is List<Map<String, dynamic>>) {
      return jsonBody.map((e) => model.fromJson(e)).toList().cast<T>();
    } else if (jsonBody is Map<String, dynamic>) {
      return model.fromJson(jsonBody);
    } else {
      return jsonBody;
    }
  }
}
