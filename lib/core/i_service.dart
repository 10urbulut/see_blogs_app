import 'package:http/http.dart';

abstract class IService<TModel> {
  Future<List<TModel>> getAll();

  Future<TModel> getWithId(int id);

  Future<Response> post(TModel model);

  Future<Response> put(TModel model);
}
