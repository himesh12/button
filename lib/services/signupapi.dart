import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dating_desire/api/apiurl.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class SignUpApiService {
  Future<Map<String, dynamic>> register(
      {required Map<String, dynamic> userData}) async {
    print(userData);

    try {
      /*FormData formData = FormData.from({
        "name_image": _txtNameImage.text,
        "image": UploadFileInfo(File("$_image"), "image.jpg")
      });*/
      //.uploadImage(data: formData, options: CrudComponent.options);

      // ignore: await_only_futures
      FormData datauser = await FormData.fromMap(userData);
      try {
        Dio dio = new Dio();
        dio.options.headers = {
          'Content-type': 'multipart/form-data',
          'Accept': 'application/json',
        };
        print(userData['phone']);
        Response response =
            await dio.post(ApiUrlsRegistration.register, data: datauser);
        print('here ${response.data['output']}');

        Map<String, dynamic> newData = response.data;
        print(response.statusCode);
        print(response);

        if (response.statusCode != 200) {
          return {
            'statuscode': "400",
            'message': newData['message'],
            'success': 600
          };
        }

        newData.addAll({'statuscode': response.statusCode, 'success': 200});

        return newData;
      } catch (e) {
        print('incatch');
        print(e);
      }
      return {};
    } on SocketException {
      //  throw FetchDataException('No Internet connection');
      return {
        'statuscode': 500,
        'message': "No Internet Connection",
        'success': 600
      };
    }

    //  return {'statuscode': 400, 'message': 'server error'};
//      }
  }

  Future<Map<String, dynamic>> sendotponnumber(
      {required Map<String, dynamic> userData}) async {
    try {
      http.Response response = await http.post(
          Uri.parse(ApiUrlsRegistration.sendotpregisterapi),
          headers: {
            "key": "X-Requested-With",
            "value": "XMLHttpRequest",
            "type": "text"
          },
          body: userData);
      print(response);
      if (response.statusCode != 200) {
        if (response.statusCode == 500) {
          return {
            'statuscode': 400,
            'message': 'Phone numebr already registered!',
            'success': 422
          };
          //  print(respData);
        }
        return {'statuscode': 400, 'message': 'Server Issue', 'success': 600};
      }
      Map<String, dynamic> respData = json.decode(response.body);
      respData.addAll({'statuscode': response.statusCode});
      return respData;
    } on SocketException {
      return {'statusCode': 400, 'message': 'Connection lost', 'success': 600};
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

  Future<Map<String, dynamic>> verifyotp(
      {required Map<String, dynamic> userData}) async {
    print(userData);

    try {
      http.Response response = await http.post(
          Uri.parse(ApiUrlsRegistration.verifyotpregisterapi),
          body: userData);
      print(response.body);
      if (response.statusCode != 200) {
        return {'statuscode': 400, 'message': 'Server Issue', 'success': 600};
      }
      Map<String, dynamic> respData = json.decode(response.body);
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

    //  return {'statuscode': 400, 'message': 'server error'};
//      }
  }
}
