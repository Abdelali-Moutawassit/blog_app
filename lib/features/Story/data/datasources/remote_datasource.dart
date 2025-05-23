import 'package:blog_app/core/databases/api/api_consumer.dart';
import 'package:blog_app/core/databases/api/end_points.dart';
import 'package:blog_app/features/Story/data/models/story_model.dart';

class RemoteDatasource {
  final ApiConsumer api;

  RemoteDatasource({required this.api});

  Future<List<StoryModel>> getStories() async {
    try {
      final responseJson = api.get(EndPoints.stories);
      return (responseJson as List)
          .map((storie) => StoryModel.fromJson(storie))
          .toList();
    } catch (e) {
      throw Exception("Error lors de recuperation du stories : $e");
    }
  }
}
