import 'dart:convert';
import 'package:http/http.dart' as http;

getusers() async {
  try {
    var response =
        await http.get(Uri.parse("https://randomuser.me/api/?results=50"));

    var body = jsonDecode(response.body);

    return body['results'];
  } catch (err) {
    // ignore: avoid_print
    print(err.toString());
  }
}
