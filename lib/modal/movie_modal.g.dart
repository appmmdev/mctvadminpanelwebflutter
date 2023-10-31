// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModal _$MovieModalFromJson(Map<String, dynamic> json) => MovieModal(
      json['movietitle'] as String,
      json['description'] as String,
      json['movie_cover_img'] as String,
      json['movie_img'] as String,
      json['link'] as String,
      json['year'] as String,
      json['catagory'] as String,
      json['studio'] as String,
    );

Map<String, dynamic> _$MovieModalToJson(MovieModal instance) =>
    <String, dynamic>{
      'movietitle': instance.movietitle,
      'description': instance.description,
      'movie_cover_img': instance.movie_cover_img,
      'movie_img': instance.movie_img,
      'link': instance.link,
      'year': instance.year,
      'catagory': instance.catagory,
      'studio': instance.studio,
    };
