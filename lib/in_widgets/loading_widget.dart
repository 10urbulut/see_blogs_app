import 'package:flutter/material.dart';

class LoadingWidget {
  static getLoadingCircularDialog({
    required BuildContext context,
  }) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return GestureDetector(
          onLongPress: () => Navigator.pop(context),
          child: const SimpleDialog(
            children: [
              Center(
                child: RefreshProgressIndicator(color: Colors.black),
              ),
            ],
          ),
        );
      },
    );
  }
}
