import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class RickyMortyRepository extends Disposable {
  final Dio _client;

  RickyMortyRepository(this._client);

  Future fetchPost() async {
    final response = await _client.get('https://rickandmortyapi.com/api/character');
    return response.data;
  }

  Future getDetailsById(int id) async {
    final response = await _client.get('https://rickandmortyapi.com/api/character/$id');
    return response.data;
  }

  @override
  void dispose() {}
}
