import 'package:flutter/widgets.dart';

class PokemonUtils {
  static String getPokemonImage(String number) {
    return 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$number.png';
  }

  static Color getTypeColor(String type) {
    switch (type) {
      case 'Normal':
        return Color(0xFFbabb96);
      case 'Fire':
        return Color(0xFFf19c65);
      case 'Fighting':
        return Color(0xFFca6260);
      case 'Water':
        return Color(0xFF8ca5f2);
      case 'Flying':
        return Color(0xFFb9a5f2);
      case 'Grass':
        return Color(0xFFA7DB8D);
      case 'Poison':
        return Color(0xFFb26bb4);
      case 'Electric':
        return Color(0xFFf8db65);
      case 'Ground':
        return Color(0xFFe6cd8c);
      case 'Psychic':
        return Color(0xFFf67ba3);
      case 'Rock':
        return Color(0xFFc6b56b);
      case 'Ice':
        return Color(0xFFafe1e0);
      case 'Bug':
        return Color(0xFFbac95b);
      case 'Ghost':
        return Color(0xFF917eae);
      case 'Dark':
        return Color(0xFF918074);
      case 'Steel':
        return Color(0xFFc7c6d9);
      case 'Fairy':
        return Color(0xFFf0adbe);
      default:
        return Color(0xFF7f8992);
    }
  }
}
