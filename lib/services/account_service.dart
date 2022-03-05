import 'package:see_blogs_app/core/base_service.dart';
import 'package:see_blogs_app/models/account_model/account_model.dart';

class AccountService {
  static final AccountService _singleton = AccountService._internal();
  factory AccountService() {
    return _singleton;
  }
  AccountService._internal();

  Future updateAccount(AccountModel accountModel) async {
    var response =
        await BaseService.post(path: "/Account/Update", model: accountModel);
  }
}
