import '../utils/values.dart';


class APIService {

  ///- For Url
  String createPath(String path) {
    return Values.baseUrl + path;
  }

  ///- For Parameters or (Post Function Body)
  Map createPayload(Map params) {
    return {
      "jsonrpc": "2.0",
      "method": "call",
      "id": 1,
      "params": params,
    };
  }


}
