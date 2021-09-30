import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dating_desire/api/apiurl.dart';
import 'package:http/http.dart' as http;

class ApiForgotPassword {
  Future<Map<String, dynamic>> checkmember(
      {required Map<String, dynamic> userData}) async {
    try {
      http.Response response = await http
          .post(Uri.parse(ApiUrlsForgotPassword.checkmember), body: userData);
      if (response.statusCode != 200) {
        return {'statusCode': 400, 'message': 'Server Issue', 'success': 600};
      }
      Map<String, dynamic> respData = json.decode(response.body);
      respData.addAll({'statusCode': response.statusCode});
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

    //  return {'statuscode': 400, 'message': 'server error'};
//      }
  }

  Future<Map<String, dynamic>> otpsend(
      {required Map<String, dynamic> userData}) async {
    try {
      http.Response response = await http
          .post(Uri.parse(ApiUrlsForgotPassword.sendotp), body: userData);
      if (response.statusCode != 200) {
        return {'statusCode': 400, 'message': 'Server Issue', 'success': 600};
      }
      Map<String, dynamic> respData = json.decode(response.body);
      respData.addAll({'statusCode': response.statusCode});
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

    //  return {'statuscode': 400, 'message': 'server error'};
//      }
  }

  Future<Map<String, dynamic>> otpverify(
      {required Map<String, dynamic> userData}) async {
    try {
      http.Response response = await http
          .post(Uri.parse(ApiUrlsForgotPassword.verifyotp), body: userData);
      if (response.statusCode != 200) {
        return {'statusCode': 400, 'message': 'Server Issue', 'success': 600};
      }
      Map<String, dynamic> respData = json.decode(response.body);
      respData.addAll({'statusCode': response.statusCode});
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

    //  return {'statuscode': 400, 'message': 'server error'};
//      }
  }
}
