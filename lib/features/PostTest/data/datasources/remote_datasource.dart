import 'package:blog_app/core/databases/api/api_consumer.dart';
import 'package:blog_app/core/databases/api/end_points_api.dart';
import 'package:blog_app/features/PostTest/data/models/post_model.dart';

class RemoteDatasource {
  final ApiConsumer api;

  RemoteDatasource({required this.api});

  Future<List<PostModel>> getPosts() async {
    try {
      final responseJson = await api.get(EndPointsApi.posts);
      if (responseJson == null) {
        throw Exception("Aucune donnée reçue");
      }

      final List<dynamic> postsJson = responseJson;

      return postsJson.map((post) => PostModel.fromJson(post)).toList();
    } catch (error) {
      throw Exception("Erreur lors de recuperation de posts: $error");
    }
  }

  Future<void> addReactionToPost({
  required int postId,
  required int userId,
  required String reactionType,
}) async {
  try {
    final endpoint = '${EndPointsApi.posts}/$postId/reactions?userId=$userId';
    final body = {'type': reactionType};

    await api.post(endpoint, data: body);
  } catch (error) {
    throw Exception('Erreur lors de l’ajout de la réaction : $error');
  }
}

}
