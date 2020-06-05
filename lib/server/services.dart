import 'dart:convert';
import 'package:flutterdemo/model/album.dart';
import 'package:flutterdemo/model/personModel.dart';
import 'package:http/http.dart' as http;
import '../model/album.dart';


class Services {
  static const String url = "http://jsonplaceholder.typicode.com/";

  static Future<List<Album>> getPhotos() async {
    try {
      final response = await http.get(url+"photos");
      if (response.statusCode == 200) {
        List<Album> list = parsePhotos(response.body);
        return list;
      }
    } catch (e) {
      e.toString();
    }
  }

  static List<Album> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }
   static Future<Person> createAlbum(Map data) async {
    String url="https://reqres.in/api/users";
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:  json.encode(data)/*jsonEncode(<String, String>{
        'title': title,
      })*/,
    );
    if (response. statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print('Album:${json.decode(response.body)}');
      Person person=Person.fromJson(json.decode(response.body));
      print("Album"+person.name);

      return Person.fromJson(json.decode(response.body));
    } else {

      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
