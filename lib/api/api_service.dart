import 'package:hr_app/model/login_model.dart';
import 'package:hr_app/model/reset_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "http://10.0.0.143:8015/userservices/authenticate";

    final response = await http.post(url, body: requestModel.toJson());
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      return LoginResponseModel(
          error: 'Failed to load Data. Please, enter correct infomation');
    }
  }

  Future<ResetResponseModel> reset(ResetRequestModel requestModel) async {
    String url = "http://10.0.0.143:8015/userservices/reset";

    final response = await http.post(url, body: requestModel.toJson());
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return ResetResponseModel.fromJson(json.decode(response.body));
    } else {
      return ResetResponseModel(
          error: 'Failed to load Data. Please, enter correct infomation');
    }
  }
}
