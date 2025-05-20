import 'package:blog_app/core/databases/api/api_consumer.dart';
import 'package:blog_app/core/databases/api/end_points.dart';

class RemteDatasource {
  final ApiConsumer api;

  RemteDatasource({required this.api});

  // Login

  Future<Map<String, dynamic>> login(String username, String password) async {
  try {
    final token = await api.postLogin(
      EndPoints.login,
      data: {
        "username": username,
        "password": password,
      },
    );

    if (token.containsKey("token")) {
      return token;
    } else {
      throw Exception("Erreur de login : réponse inattendue");
    }
  } catch (error) {
    throw Exception("Erreur lors de login : $error");
  }
}

}
