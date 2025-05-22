import 'package:blog_app/core/databases/api/api_consumer.dart';
import 'package:blog_app/core/databases/api/end_points.dart';
import 'package:blog_app/features/Profile/data/models/profile_model.dart';

class RemoteDatasource {
  final ApiConsumer api;
  RemoteDatasource({required this.api});

  Future<ProfileModel> getProfile() async {
    try {
      final responseJson = await api.get(EndPoints.profile);
      if (responseJson == null) {
        throw Exception("Aucune donnée reçue");
      }
      return ProfileModel.fromJson(responseJson);
    } catch (e) {
      throw Exception("Erreur lors de recuparation de profile : $e");
    }
  }
}
