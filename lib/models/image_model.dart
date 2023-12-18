import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class UnsplashImage {
  String id;
  UnsplashUrls urls;
  String? description;

  UnsplashImage({
    this.description,
    required this.id,
    required this.urls,
  });

  factory UnsplashImage.fromJson(Map<String, dynamic> json) =>
      _$UnsplashImageFromJson(json);

  Map<String, dynamic> toJson() => _$UnsplashImageToJson(this);
}

@JsonSerializable()
class UnsplashUrls {
  String raw;
  String full;
  String small;

  UnsplashUrls({required this.raw, required this.full, required this.small});

  factory UnsplashUrls.fromJson(Map<String, dynamic> json) =>
      _$UnsplashUrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UnsplashUrlsToJson(this);
}

@JsonSerializable()
class PixelformImage {
  String id;
  String filename;
  String? title;

  @JsonKey(name: 'url_full_size')
  String urlFullSize;

  @JsonKey(name: 'url_small_size')
  String urlSmallSize;

  PixelformImage(
      {this.title,
      required this.id,
      required this.filename,
      required this.urlFullSize,
      required this.urlSmallSize});

  factory PixelformImage.fromJson(Map<String, dynamic> json) =>
      _$PixelformImageFromJson(json);

  Map<String, dynamic> toJson() => _$PixelformImageToJson(this);
}
