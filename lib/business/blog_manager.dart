// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:see_blogs_app/models/blog_model/blog_model.dart';
import 'package:see_blogs_app/models/category/category_model.dart';
import 'package:see_blogs_app/services/blog_service.dart';

class BlogManager extends ChangeNotifier {
  final BlogService _service = BlogService();

  List<CategoryModel> _categories = [];
  late CategoryModel _category;
  List<BlogModel> _blogs = [];
  late BlogModel _blog;
  List<BlogModel> _favoriteBlogs = [];

  Future<void> getCategoriesAll() async {
    var result = await _service.getCategories();
    _categories.clear();
    _categories.addAll(result);
    notifyListeners();
  }

  Future<void> getBlogsWithCategoryId({String? categoryId}) async {
    var result = await _service.getBlogs(categoryId: categoryId);
    _blogs.clear();
    _blogs.addAll(result);
    notifyListeners();
  }

  void addFavoriteBlogToList(BlogModel favoriteBlog) {
    _favoriteBlogs.add(favoriteBlog);
    notifyListeners();
  }

  void removeFavoriteBlogFromList(BlogModel favoriteBlog) {
    _favoriteBlogs.remove(favoriteBlog);
    notifyListeners();
  }

  List<CategoryModel> get categories => _categories;
  CategoryModel get category => _category;
  get getCategories => getCategoriesAll();

  List<BlogModel> get blogs => _blogs;
  List<BlogModel> get favoriteBlogs => _favoriteBlogs;
  BlogModel get blog => _blog;
  set setBlog(BlogModel value) => _blog = value;
}
