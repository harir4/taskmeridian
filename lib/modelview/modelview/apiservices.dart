import 'dart:convert';

import 'package:task/Helper/apiHelper.dart';
import 'package:task/model/dataModel.dart';
import 'package:task/utils/endpoints.dart';

class ApiServices {
  final apiHelper = ApiHelper();

  Future<List<ApiModel>> getData() async {
    final response = await apiHelper.getData(
        url: ApiConstants.baseUrl + ApiConstants.allData);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data.map<ApiModel>((e) => ApiModel.fromJson(e)).toList();
    } else {
      throw Exception('sometthing went wrong');
    }
  }
}
