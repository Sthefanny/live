import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patience/app/core/configs/url_config.dart';

import '../models/cards_model.dart';
import '../models/decks_model.dart';
import '../repositories/deck_api_repository.dart';

class DeckService extends Disposable {
  final DeckApiRepository _deckApiRepository;

  DeckService(this._deckApiRepository);

  Future<DecksModel> getDecks(int count) async {
    return await _deckApiRepository.getDecks(count);
  }

  Future<CardsModel> drawCards(String deckId, int count) async {
    var dio = Dio();
    var result = await dio.get('${UrlConfig.baseurl}$deckId/draw/?count=$count');
    return CardsModel.fromJson(result.data);
  }

  @override
  void dispose() {}
}
