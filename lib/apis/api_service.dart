import 'dart:convert';
import 'dart:developer';
import 'package:traning/Models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:traning/Models/show_model.dart';
import '../models/show_detail_model.dart';
import '../utils/app_constants.dart';
import '../utils/app_url.dart';

class ApiServices {

  // PRODUCT REST API CALL

  Future<List<ProductModel>?> getProduct(context) async {
    try {
      var url = Uri.parse(AppUrl.baseURL + AppUrl.showAndPointURL);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        log("RESPONSE :: ${response.body}");
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        AppConstants().showSnackBar(context, "Data Not Found");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // MOVIE SHOWLIST API CALL

  Future<List<ShowModel>?> getShow(context) async {
    try {
      var url = Uri.parse(AppUrl.baseURL1 + AppUrl.showAndPointURL1);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        log("RESPONSE :: ${response.body}");
        return data.map((e) => ShowModel.fromJson(e)).toList();
      } else {
        AppConstants().showSnackBar(context, "Data Not Found");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  /*//MOVIE SHOWDETAIL API CALL

  Future<List<ShowDetailModel>?> getShowDetail(context) async {
    try {
      var url = Uri.parse(AppUrl.baseURL1 + AppUrl.showAndPointURL1.replaceAll(":id", ));
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        log("RESPONSE :: ${response.body}");
        return data.map((e) => ShowDetailModel.fromJson(e)).toList();
      } else {
        AppConstants().showSnackBar(context, "Data Not Found");
      }
    } catch (e) {
      log(e.toString());
    }
  }*/

}
