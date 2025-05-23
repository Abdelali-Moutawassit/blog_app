import 'package:blog_app/features/Story/domain/entities/story_entity.dart';

class StoryModel extends StoryEntity {
  StoryModel({
    required super.id,
    required super.login,
    required super.avatarUrl,
  });

  factory StoryModel.fromJson(Map<String, dynamic> map) {
    return StoryModel(
      id: map['id'],
      login: map['login'],
      avatarUrl: map['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'login': login, 'avatar_url': avatarUrl};
  }
}
