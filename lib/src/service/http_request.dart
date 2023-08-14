import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

const String apiAdress = 'sok.tomskneft.ru';
const String apiLogin = 'MobileClient';
const String apiPass = 'gA0do1ry';
const String apiKey = '86476cb1-558e-4684-a621-fujedb269968';
const String userToken = 'ED56169797C2FC0D183356A129F94C31';
const String url = 'https://sok.tomskneft.ru';
const String serviceName = '/MobService/hs/api/v3';

class HttpRequest {
  static String logPassBase64 = base64.encode(utf8.encode('$apiLogin:$apiPass'));

  static Future<String> getResponse(String method) async{
    final response = await http.Client().get(Uri.parse('$url/$serviceName/$method'),
        headers: {
        'usertoken': userToken,
        'ApiKey': apiKey,
        'Host': apiAdress,
        'Authorization': 'Basic $logPassBase64',
        'Content-Type': 'application/json'
        });
    return utf8.decode(response.bodyBytes);
  }


}