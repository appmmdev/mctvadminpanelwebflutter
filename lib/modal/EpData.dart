
import 'package:json_annotation/json_annotation.dart';
part 'EpData.g.dart';
@JsonSerializable()
class EpData{

  final String ep_no,link;

  EpData(this.ep_no, this.link);

    factory EpData.fromJson(Map<String, dynamic> json) =>
      _$EpDataFromJson(json);

  Map<String, dynamic> toJson() => _$EpDataToJson(this);
}