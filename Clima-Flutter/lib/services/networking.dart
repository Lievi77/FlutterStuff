import 'package:http/http.dart' as http; //we can assign aliases like in Python
import 'dart:convert' as con;

class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    //to parse the raw json we use the jsonDecode method

    //response.body is a string!
    //con.jsonDecode(response.body)['coord']['lon];

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = con.jsonDecode(response.body);

      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
