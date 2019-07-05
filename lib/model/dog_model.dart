import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;

  int rating = 10;

  Dog(this.name, this.location, this.description);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = HttpClient();
    try {
      // Use darts Uri builder
      var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      // The dog.ceo API returns a JSON object with a property
      // called 'message', which actually is the URL.
      imageUrl = json.decode(responseBody)['message'];
    } catch (exception) {
      print(exception);
    }
  }

/*  Future<DogAPI> fetchDogImage(http.Client client) async{
    final response = await client.get('https://dog.ceo/api/breeds/image/random');
    Map<String, dynamic> mapResponse = json.decode(response.body);
    return DogAPI.fromJSON(mapResponse);
    //return DogAPI.fromJSON(json.decode(response.body));

  }
  */
}

class DogAPI {
  String imageUrl;
  String status;

  DogAPI({this.imageUrl, this.status});

  factory DogAPI.fromJSON(Map<String, dynamic> json) {
    return DogAPI(
      imageUrl: json['message'],
      status: json['status'],
    );
  }
}
