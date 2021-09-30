import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dating_desire/api/apiurl.dart';
import 'package:dating_desire/constants/userdetails.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiUpdateDetails {
  Future<Map<String, dynamic>> updatedetails(
      {required Map<String, dynamic> userData}) async {
    try {
      // ignore: await_only_futures
      FormData datauser = await FormData.fromMap(userData);
      Dio dio = new Dio();
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accesstoken',
      };
      Response response = await dio
          .post(ApiUrlsUpdateUserDetails.updateuserdetails, data: datauser);
      Map<String, dynamic> respData = response.data;

      if (response.statusCode != 200) {
        return {'statuscode': 400, 'message': 'User not found', 'success': 600};
      }
      respData.addAll({'statuscode': response.statusCode});
      print(respData);
      return respData;
    } on SocketException {
      return {
        'statuscode': 400,
        'message': 'No internet found',
        'success': 600
      };
    } catch (e) {
      print("Error while loging with otp : $e");
      return {
        'statuscode': 400,
        'message': 'Something Went error',
        'success': 600
      };
    }
  }

  Future<Map<String, dynamic>> userdetails({required String token}) async {
    try {
      http.Response response = await http
          .get(Uri.parse(ApiUrlsUpdateUserDetails.userdetails), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      Map<String, dynamic> respData = json.decode(response.body);
      if (response.statusCode != 200) {
        return {
          'statuscode': 400,
          'message': respData['message'],
          'success': 600
        };
      }
      respData.addAll({'statuscode': response.statusCode});
      return respData['output'];
    } on SocketException {
      return {
        'statuscode': 400,
        'message': 'No internet found',
        'success': 600
      };
    } catch (e) {
      print("Error while loging with otp : $e");
      return {
        'statuscode': 400,
        'message': 'Something Went error',
        'success': 600
      };
    }
  }
}
