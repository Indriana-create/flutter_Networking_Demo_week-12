import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  getData();
}

Future<void> getData() async {
  var data;
  data = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //print(data.body);

  var dataJson = jsonDecode(data.body);
  print(dataJson[0]['userId']);
  print(dataJson[0]['id']);
  print(dataJson[0]['title']);
  print(dataJson[0]['body']);

  //for all json data
  for (var i = 0; i < dataJson.length; i++) {
    print(dataJson[i]['userId']);
    print(dataJson[i]['id']);
    print(dataJson[i]['title']);
    print(dataJson[i]['body']);
  }
}