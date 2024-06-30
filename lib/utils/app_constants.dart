import 'package:flutter/material.dart';

class AppConstants {

  void showSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
          child: Text(message),
        ),
        duration: const Duration(milliseconds: 1500),
        width: 300,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

}