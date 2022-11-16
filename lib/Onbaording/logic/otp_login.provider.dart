import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginAPI {
  Future<bool> checkPhone(
    phone,
  ) async {
    Response response = await http.get(Uri.parse(
        "https://sangaiticket.globizsapp.com/api/reportusers?mobile_no=$phone"));
    if (response.statusCode == 200) {
      print(response.body);
      return true;
      //true

    } else {
      return false;
    }
  }
}
