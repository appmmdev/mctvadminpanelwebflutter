
import 'package:json_annotation/json_annotation.dart';
import 'package:mctvadminweb/modal/EpData.dart';

part 'series_modal.g.dart';

@JsonSerializable()
class SeriesModal {
 final String movietitle,
      description,
      series_cover_img,
      movie_img,
      year,
      catagory,
      studio;
 final List<EpData> link;

  SeriesModal(this.movietitle, this.description, this.series_cover_img, this.movie_img, this.year, this.catagory, this.studio, this.link);

    factory SeriesModal.fromJson(Map<String, dynamic> json) =>
      _$SeriesModalFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesModalToJson(this);
}
