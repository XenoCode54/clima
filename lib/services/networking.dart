import 'dart:convert';

import 'package:http/http.dart' as http;

class Networker {
  final String url;

  Networker(this.url);

  Future getData() async {
    http.Response response = await http.get(url);
    int statusCode = response.statusCode;
    String body = response.body;

    if (statusCode == 200) {
      return jsonDecode(body);
    } else {
      print('statusCode: $statusCode');
    }
  }
}
