import 'dart:async';
import 'dart:io';
import 'package:dating_desire/api/apiurl.dart';
import 'package:dating_desire/constants/userdetails.dart';
import 'package:dio/dio.dart';

class ApiLogout {
  Future<Map<String, dynamic>> logout() async {
    try {
      Dio dio = new Dio();
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accesstoken',
      };
      Response response = await dio.get(ApiUrlsLogout.logout);
      Map<String, dynamic> respData = response.data;

      if (response.statusCode != 200) {
        return {'statuscode': 400, 'message': 'Server Issue', 'success': 600};
      }
      respData.addAll({'statuscode': response.statusCode});
      return respData;
    } on SocketException {
      throw "connection lost";
    } catch (e) {
      print("Error while loging with otp : $e");
      return {
        'statusCode': 400,
        'message': 'Something Went error',
        'success': 600
      };
    }
  }
}
