import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<daftaracara> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://api.nextgenapp.net/api-nextgen/event/'),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader: '1a2f563a88755bd45fe93f797dc5e179d175db6d ',
    },
  );
  final responseJson = jsonDecode(response.body);

  return daftaracara.fromJson(responseJson);
}

List<daftaracara> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<daftaracara>((json) => daftaracara.fromJson(json)).toList();
}

class daftaracara {
  final String name;
  final String image;
  final String description;

  const daftaracara({
    required this.name,required this.image,required this.description,
  });

  factory daftaracara.fromJson(Map<String, dynamic> json) {
    return daftaracara(
      name: json['name'],image: json['image'],description: json['description'],
    );
  }
}