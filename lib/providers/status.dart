import 'package:covid_19/models/situation.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StatusProvider {
  Future<Situation> getStatus() async {
    final http.Response response =
        await http.get('https://hpb.health.gov.lk/api/get-current-statistical');
    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);
    return Situation.fromJson(responseData['data']);
  }
}
