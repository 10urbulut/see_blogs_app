import 'package:http/http.dart';

abstract class IManager<TModel> {
  Future<Response> get({int? id});

  Future<Response> add(TModel model);

  Future<Response> update(TModel model);
}
