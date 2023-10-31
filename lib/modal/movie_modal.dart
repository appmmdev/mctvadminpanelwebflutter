import 'package:json_annotation/json_annotation.dart';

part 'movie_modal.g.dart';

@JsonSerializable()
class MovieModal {
  final String movietitle,
      description,
      movie_cover_img,
      movie_img,
      link,
      year,
      catagory,
      studio;

  MovieModal(this.movietitle, this.description, this.movie_cover_img,
      this.movie_img, this.link, this.year, this.catagory, this.studio);

  factory MovieModal.fromJson(Map<String, dynamic> json) =>
      _$MovieModalFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModalToJson(this);
}
