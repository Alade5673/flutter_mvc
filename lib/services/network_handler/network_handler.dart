// import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class NetworkHandler{
  static final client = http.Client();
  // static final box = new GetStorage();

  static Future<String> post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      "Content-type": "application/json"
    });
    // print(response.body);
    return response.body;
  }

  static Uri buildUrl(String endpoint){
    String host = "https://staging-jobgam.herokuapp.com/auth/";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

// static void storeToken(String token) aync {
//   box.write('new_token', new_token);
//
// }
}