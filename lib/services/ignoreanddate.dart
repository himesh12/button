import 'dart:io';
import 'package:dating_desire/api/apiurl.dart';
import 'package:dating_desire/constants/userdetails.dart';
import 'package:dio/dio.dart';

class IgnoreAndDate {
  Future<Map<String, dynamic>> ignoreadd(String otheruserid) async {
    try {
      Dio dio = new Dio();
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accesstoken',
      };

      Response response = await dio
          .post(Apiofignore.ignore, queryParameters: {'user_id': otheruserid});
      Map<String, dynamic> respData = response.data;

      if (response.statusCode != 200) {
        return {'statuscode': 400, 'message': 'User not found', 'success': 600};
      }
      respData.addAll({'statuscode': response.statusCode});

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

  Future<Map<String, dynamic>> ignoreget() async {
    try {
      Dio dio = new Dio();
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accesstoken',
      };

      Response response = await dio.get(
        Apiofignore.ignore,
      );
      Map<String, dynamic> respData = response.data;

      if (response.statusCode != 200) {
        return {'statuscode': 400, 'message': 'User not found', 'success': 600};
      }
      respData.addAll({'statuscode': response.statusCode});

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

  Future<Map<String, dynamic>> dateadd(String otheruserid) async {
    try {
      Dio dio = new Dio();
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accesstoken',
      };

      Response response = await dio
          .post(Apiofdate.add, queryParameters: {'user_id': otheruserid});
      Map<String, dynamic> respData = response.data;

      if (response.statusCode != 200) {
        return {'statuscode': 400, 'message': 'User not found', 'success': 600};
      }
      respData.addAll({'statuscode': response.statusCode});

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

  Future<Map<String, dynamic>> dateget() async {
    try {
      Dio dio = new Dio();
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accesstoken',
      };

      Response response = await dio.get(
        Apiofdate.add,
      );
      Map<String, dynamic> respData = response.data;

      if (response.statusCode != 200) {
        return {'statuscode': 400, 'message': 'User not found', 'success': 600};
      }
      respData.addAll({'statuscode': response.statusCode});

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
}
