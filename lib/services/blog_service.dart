import 'dart:convert';

import 'package:http/http.dart';
import 'package:see_blogs_app/constants/strings/toastr_strings.dart';
import 'package:see_blogs_app/core/base_service.dart';
import 'package:see_blogs_app/core/utilities/toastr.dart';
import 'package:see_blogs_app/environment.dart';
import 'package:see_blogs_app/models/blog_model/blog_model.dart';
import 'package:see_blogs_app/models/category/category_model.dart';

class BlogService extends BaseService<BlogService> {
  static final BlogService _singleton = BlogService._internal();
  factory BlogService() {
    return _singleton;
  }
  BlogService._internal();

  Future<List<CategoryModel>> getCategories() async {
    CategoryModelData modelData = await BaseService.get(
        modelData: CategoryModelData(), path: "Blog/GetCategories");
    modelData.hasError == true
        ? Toastr.buildErrorToast(modelData.message)
        : null;
    return modelData.data ?? Toastr.buildNotifyToast(ToastrStrings.NO_DATA);
  }

  Future<List<BlogModel>> getBlogs({String? categoryId}) async {
    Map<String, String> model =
        categoryId == null ? {} : {"CategoryId": categoryId};
    Response response = await post(
        Uri.parse(Environment.baseUri + "Blog/GetBlogs"),
        body: jsonEncode(model),
        headers: Environment.apiHeader);

    BlogModelData modelData =
        BaseService.jsonBodyParser(BlogModelData(), response.body);

    modelData.hasError == true
        ? Toastr.buildErrorToast(modelData.message.toString())
        : null;
    return modelData.data ?? Toastr.buildNotifyToast(ToastrStrings.NO_DATA);
  }
}
