import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/image_model.dart';

class ImageRepository {
  Future<List<UnsplashImage>> getNetworkImages() async {
    var endpointUrl =
        Uri.parse('https://api.unsplash.com/photos/random?count=10');

    final response = await http.get(endpointUrl,
        headers: {HttpHeaders.authorizationHeader: 'Client-ID '});

    if (response.statusCode == 200) {
      final List<dynamic> decodeList = jsonDecode(response.body) as List;
      final List<UnsplashImage> randomImages = decodeList.map((listItem) {
        return UnsplashImage.fromJson(listItem);
      }).toList();

      return randomImages;
    } else {
      throw Exception('Unsplash API not successful');
    }
  }
}
