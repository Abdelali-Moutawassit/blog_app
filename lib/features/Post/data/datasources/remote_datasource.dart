import 'package:blog_app/core/databases/api/api_consumer.dart';
import 'package:blog_app/core/databases/api/end_points.dart';
import 'package:blog_app/features/Post/data/models/post_model.dart';

class RemoteDatasource {
  final ApiConsumer api;

  RemoteDatasource({required this.api});

  Future<List<PostModel>> getPosts() async {
    try {
      final responseJson = await api.get(EndPoints.posts);
      if (responseJson == null) {
        throw Exception("Aucune donnée reçue");
      }

      final List<dynamic> postsJson = responseJson['posts'];

      return postsJson.map((post) => PostModel.fromJson(post)).toList();
    } catch (error) {
      throw Exception("Erreur lors de recuperation de posts: $error");
    }
  }
}
