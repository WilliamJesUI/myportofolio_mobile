import 'package:json_annotation/json_annotation.dart';

part 'achievement.g.dart';

/// Portfolio achievement synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Achievement {
  const Achievement({
    required this.name,
    required this.description,
    this.thumbnail,
    this.flamedBy = const [],
    this.id,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;
  final String name;
  final String description;
  final String? thumbnail;

  /// IDs of the users who flamed this achievement (read-only on the server side).
  @JsonKey(defaultValue: [], includeToJson: false)
  final List<int> flamedBy;

  Map<String, dynamic> toJson() => _$AchievementToJson(this);
}
