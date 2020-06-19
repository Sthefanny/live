import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EspRepository extends Disposable {
  final String _baseUrl = 'http://192.168.0.102';
  final Dio client;

  EspRepository(this.client) {
    client.options.baseUrl = _baseUrl;
  }

  Future getState() async {
    var url = '/state';
    final response = await client.get(url);
    return response.data;
  }

  Future turnLight(String lightColor, String state) async {
    var url = '/led/turn';
    final response = await client.get(url, options: Options(headers: {'$lightColor': '$state'}));
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
