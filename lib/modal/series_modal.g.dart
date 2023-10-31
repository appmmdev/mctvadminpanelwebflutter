// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesModal _$SeriesModalFromJson(Map<String, dynamic> json) => SeriesModal(
      json['movietitle'] as String,
      json['description'] as String,
      json['series_cover_img'] as String,
      json['movie_img'] as String,
      json['year'] as String,
      json['catagory'] as String,
      json['studio'] as String,
      (json['link'] as List<dynamic>)
          .map((e) => EpData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesModalToJson(SeriesModal instance) =>
    <String, dynamic>{
      'movietitle': instance.movietitle,
      'description': instance.description,
      'series_cover_img': instance.series_cover_img,
      'movie_img': instance.movie_img,
      'year': instance.year,
      'catagory': instance.catagory,
      'studio': instance.studio,
      'link': instance.link,
    };
