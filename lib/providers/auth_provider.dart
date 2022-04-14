import 'package:aaveg_app/models/auth_model.dart';
import 'package:get/get_connect/connect.dart';
import 'package:aaveg_app/providers/constants.dart';

class AuthProvider extends GetConnect {
  Future<AuthModel> getTokenResponse(String code) async {
    final response =
        await post("${Constants.baseUrl}/api/user/login", {"code": code});
    if (response.statusCode == 200) {
      return authModelFromJson(response.bodyString!);
    } else {
      return Future.error(response.statusText!);
    }
  }
}
