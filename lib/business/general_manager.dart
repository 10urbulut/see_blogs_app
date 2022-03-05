import 'dart:io';

import 'package:flutter/material.dart';
import 'package:see_blogs_app/services/general_service.dart';

class GeneralManager extends ChangeNotifier {
  GeneralService _service = GeneralService();

  Future uploadFile(File file) async {
    var result = await _service.uploadImage(file);
    
  }
}
