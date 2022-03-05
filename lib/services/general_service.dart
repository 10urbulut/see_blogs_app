import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:see_blogs_app/environment.dart';

class GeneralService {
  static final GeneralService _singleton = GeneralService._internal();
  factory GeneralService() {
    return _singleton;
  }
  GeneralService._internal();

  Future uploadImage(File file) async {
    Map<String, String> header = {
      "Content-Type": "multipart/form-data",
      'Content-Lenght': file.lengthSync().toString(),
    };

    var response = await post(
        Uri.parse(Environment.baseUri + "General/UploadImage"),
        headers: header,
        body: file.readAsBytesSync().toString());

    print(response.body);
  }
}
