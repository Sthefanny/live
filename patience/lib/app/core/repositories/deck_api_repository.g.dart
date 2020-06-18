// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_api_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _DeckApiRepository implements DeckApiRepository {
  _DeckApiRepository(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://deckofcardsapi.com/api/deck/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getDecks(count) async {
    ArgumentError.checkNotNull(count, 'count');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/new/shuffle/?deck_count=$count',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DecksModel.fromJson(_result.data);
    return value;
  }

  @override
  drawCards(deckId, count) async {
    ArgumentError.checkNotNull(deckId, 'deckId');
    ArgumentError.checkNotNull(count, 'count');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/$deckId}/draw/?count=$count',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CardsModel.fromJson(_result.data);
    return value;
  }
}
