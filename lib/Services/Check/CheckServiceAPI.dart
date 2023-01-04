import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:testgetxtest/Services/Check/ICheckService.dart';

class CheckServiceAPI implements ICheckService {
  @override
  Future getAnimal() async {
    var client = http.Client();
    try {
      var response =
          await client.get(Uri.parse("https://www.boredapi.com/api/activity"));
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        return res;
      }
    } catch (e) {
      log(e.toString());
    } finally {
      client.close();
    }
  }
}
