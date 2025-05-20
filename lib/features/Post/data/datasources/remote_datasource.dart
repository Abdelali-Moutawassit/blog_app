import 'package:blog_app/core/databases/api/api_consumer.dart';
import 'package:blog_app/core/databases/api/end_points.dart';
import 'package:blog_app/features/Post/data/models/post_model.dart';

class RemoteDatasource {
  final ApiConsumer api;

  RemoteDatasource({required this.api});

  Future<List<PostModel>> getPosts() async {
    try {
      final postsJson = await api.get(EndPoints.posts);
      if (postsJson == null) {
        throw Exception("Aucune donnée reçue");
      }

      return (postsJson as List).map((post)=> PostModel.fromJson(post)).toList();
    } catch (error) {
      throw Exception("Erreur lors de login : $error");
    }
  }
}
