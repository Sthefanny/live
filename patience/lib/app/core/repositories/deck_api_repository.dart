import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../configs/url_config.dart';
import '../models/cards_model.dart';
import '../models/decks_model.dart';

part 'deck_api_repository.g.dart';

@RestApi(baseUrl: UrlConfig.baseurl)
abstract class DeckApiRepository {
  factory DeckApiRepository(Dio dio, {String baseUrl}) = _DeckApiRepository;

  @GET("/new/shuffle/?deck_count={count}")
  Future<DecksModel> getDecks(@Path() int count);

  @GET("/{deckId}/draw/?count={count}")
  Future<CardsModel> drawCards(@Path() String deckId, @Path() int count);
}
