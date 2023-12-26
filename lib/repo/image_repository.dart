import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../env/env.dart';
import '../models/image_model.dart';

class ImageRepository {
  Future<List<UnsplashImage>> getNetworkImages() async {
    try {
      var endpointUrl =
          Uri.parse('https://api.unsplash.com/photos/random?count=10');

      const unsplashApiKey = Env.unsplashApiKey;

      final response = await http.get(endpointUrl, headers: {
        HttpHeaders.authorizationHeader: 'Client-ID $unsplashApiKey'
      });

      if (response.statusCode == 200) {
        final List<dynamic> decodeList = jsonDecode(response.body) as List;
        final List<UnsplashImage> randomImages = decodeList.map((listItem) {
          return UnsplashImage.fromJson(listItem);
        }).toList();

        return randomImages;
      } else {
        throw Exception('Unsplash API not successful');
      }
    } on SocketException {
      throw Exception('No internet connection!');
    } on HttpException {
      throw Exception("Couldn't rettrieve the images! Sorry!");
    } on FormatException {
      throw Exception('Bad response formatting.');
    } catch (e) {
      throw Exception('Unknown error');
    }
  }
}
