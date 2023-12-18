// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsplashImage _$UnsplashImageFromJson(Map<String, dynamic> json) =>
    UnsplashImage(
      description: json['description'] as String?,
      id: json['id'] as String,
      urls: UnsplashUrls.fromJson(json['urls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnsplashImageToJson(UnsplashImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'urls': instance.urls,
      'description': instance.description,
    };

UnsplashUrls _$UnsplashUrlsFromJson(Map<String, dynamic> json) => UnsplashUrls(
      raw: json['raw'] as String,
      full: json['full'] as String,
      small: json['small'] as String,
    );

Map<String, dynamic> _$UnsplashUrlsToJson(UnsplashUrls instance) =>
    <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'small': instance.small,
    };

PixelformImage _$PixelformImageFromJson(Map<String, dynamic> json) =>
    PixelformImage(
      title: json['title'] as String?,
      id: json['id'] as String,
      filename: json['filename'] as String,
      urlFullSize: json['url_full_size'] as String,
      urlSmallSize: json['url_small_size'] as String,
    );

Map<String, dynamic> _$PixelformImageToJson(PixelformImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'title': instance.title,
      'url_full_size': instance.urlFullSize,
      'url_small_size': instance.urlSmallSize,
    };
