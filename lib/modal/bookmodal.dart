import 'package:json_annotation/json_annotation.dart';

part 'bookmodal.g.dart';

@JsonSerializable()
class BookModal {
  final String title, content, writer;

  BookModal({required this.title, required this.content, required this.writer});
  factory BookModal.fromJson(Map<String, dynamic> json) =>
      _$BookModalFromJson(json);

  Map<String, dynamic> toJson() => _$BookModalToJson(this);
}
