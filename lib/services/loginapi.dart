import 'dart:async';
import 'dart:convert';
import 'package:dating_desire/api/apiurl.dart';
import 'package:http/http.dart' as http;

import 'dart:io';

class LoginApiService {
  Future<Map<String, dynamic>> userLogin(
      {required Map<String, dynamic> userData}) async {
    try {
      http.Response response = await http.post(Uri.parse(ApiUrlsLogin.loginapi),
          headers: {
            "key": "X-Requested-With",
            "value": "XMLHttpRequest",
            "type": "text"
          },
          body: userData);

      Map<String, dynamic> newData = json.decode(response.body);

      if (response.statusCode >= 500) {
        return {
          'statuscode': response.statusCode,
          'message': newData['message'],
        };
      }
      if (response.statusCode < 500 && response.statusCode >= 400) {
        print(response.body);
        return {
          'statuscode': response.statusCode,
          'message': newData['message']
        };
      }
      if (response.statusCode < 400 && response.statusCode >= 300) {
        return {
          'statuscode': response.statusCode,
          'message': newData['message']
        };
      }

      if (response.statusCode != 200) {
        return {
          'statuscode': response.statusCode,
          'message': newData['message']
        };
      }

      newData.addAll({'statuscode': response.statusCode});

      return newData;
    } on SocketException {
      print('Network Error');
      //  throw FetchDataException('No Internet connection');
      return {'statuscode': 500, 'message': "No Internet Connection"};
    }

    //  return {'statuscode': 400, 'message': 'server error'};
//      }
  }
}
