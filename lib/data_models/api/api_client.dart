import 'package:ebhc/utils/app_constants.dart';
import 'package:http/http.dart';

class ApiClient {
  static Future<Response> getData(String uri, queryPara,
      {Map<String, String>? headers}) async {
    Uri linkUri = Uri.https(AppConstants.BASE_URL, uri, queryPara);
    Response response = await get(linkUri);
    return response;
  }

  static Future<Response> postData(String uri, dynamic body) async {
    Response response = await post(Uri.parse(uri), body: body);
    return response;
  }
}
