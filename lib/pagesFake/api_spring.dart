import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiSpring extends StatelessWidget {
  ApiSpring({super.key});

  final url = "http://192.168.1.107:8081/bankAccounts";
  // use dio sans ApiConsumer et get data from this api voici exemple :
  /*[
  {
    "id": "0d4e701c-6f36-47cf-b3b4-46f3497f484c",
    "createdAt": "2025-05-23T13:26:22.697+00:00",
    "balance": 99097.5619521409,
    "currency": "MAD",
    "type": "SAVING_ACCOUNT"
  },
  {
    "id": "a64b1d9e-1f9f-42c1-8e5e-efe68e2dea86",
    "createdAt": "2025-05-23T13:26:22.726+00:00",
    "balance": 82311.2433778961,
    "currency": "MAD",
    "type": "CURRENT_ACCOUNT"
  },
  */

  final dio = Dio();
  // get data from this api
  Future<void> getData() async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        print(response.data);
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }





  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Api Spring Boot"))),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              getData();
            },
            child: Text("Get Data"),
          ),
      ),
    ),
    );
  }
}
