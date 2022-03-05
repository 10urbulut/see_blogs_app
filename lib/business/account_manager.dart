import 'package:flutter/material.dart';
import 'package:see_blogs_app/models/account_model/account_model.dart';
import 'package:see_blogs_app/services/account_service.dart';

class AccountManager extends ChangeNotifier {
  final AccountService _service = AccountService();
  late AccountModel _account;
  List<String> _favoriteBlogs = [];

  Future updateAccount() async {
    _account.favoriteBlogIds = _favoriteBlogs;
    var result = await _service.updateAccount(_account);
  }

  void addFavoriteToList(String favoriteBlogId) {
    _favoriteBlogs.add(favoriteBlogId);
    _account.favoriteBlogIds = _favoriteBlogs;

    notifyListeners();
  }

  void removeFavoriteFromList(String favoriteBlogId) {
    _favoriteBlogs.remove(favoriteBlogId);
    _account.favoriteBlogIds = _favoriteBlogs;
    notifyListeners();
  }

  AccountModel get account => _account;
  set setAccount(AccountModel value) => _account = value;
}
