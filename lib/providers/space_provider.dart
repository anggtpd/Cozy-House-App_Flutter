import 'dart:convert';

import 'package:bwa_cozy/models/space.dart';
import 'package:http/http.dart' as http;

class SpaceProvider {
  static getRecommendedSpaces() async {
    var result = await http
        .get(Uri.parse('https://bwa-cozy-api.vercel.app/recommended-spaces'));

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body); //convert kedalam bentuk objek
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
