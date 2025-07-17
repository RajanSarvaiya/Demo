import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:traning/new/data/api_service/api_service.dart';
import 'package:traning/new/exception_handlers/app_exceptions.dart';

class NotificationProvider with ChangeNotifier {

  String errorMessage = "";

  int pageNo = 1;

  bool isLoading = false;
  bool isLazyLoading = false;

  startLoader() {
    isLoading = true;
    notifyListeners();
  }

  stopLoader() {
    isLoading = false;
    notifyListeners();
  }

  startLazyLoader() {
    isLazyLoading = true;
    notifyListeners();
  }

  stopLazyLoader() {
    isLazyLoading = false;
    notifyListeners();
  }

  setPageNo(int value) {
    pageNo = value;
    notifyListeners();
  }

  /// Get Notification List API
  List</*NotificationListData*/dynamic> notificationList = [];
  bool isNotificationListEmpty = false;

  clearNotificationList() {
    notificationList.clear();
    pageNo = 1;
    isNotificationListEmpty = false;
    notifyListeners();
  }

  Future getNotificationList({bool? isLazyLoading}) async {
    isLazyLoading == true ? startLazyLoader() : startLoader();
    try {
      var res = await ApiService()
          .networkService()
          .getNotificationList(pageNo.toString());

      if (res.data != null) {
        if (res.data != null && res.data!.isNotEmpty) {
          notificationList = notificationList + (res.data ?? []);
          errorMessage = "";
        } else {
          isNotificationListEmpty = true;
        }
        notifyListeners();
      }
      isLazyLoading == true ? stopLazyLoader() : stopLoader();
      return res.status;
    }
    on DioException catch (e) {
      if (e.error is CustomException) {
        final customException = e.error as CustomException;
        if(pageNo==1) {
          errorMessage = customException.message;
        } else{
          errorMessage = "";
          if(pageNo>1){
            pageNo--;
          }
        }
      isLazyLoading == true ? stopLazyLoader() : stopLoader();
      }
      isLazyLoading == true ? stopLazyLoader() : stopLoader();
    } catch (e) {
      isLazyLoading == true ? stopLazyLoader() : stopLoader();
    }
  }

  /// Clear Fleet Provider
  void clearProvider() {
    pageNo = 1;
    isLoading = false;
    isLazyLoading = false;
    isNotificationListEmpty = false;
    notificationList.clear();
    notifyListeners();
  }
}
