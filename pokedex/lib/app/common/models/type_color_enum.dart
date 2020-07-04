enum TypeColorEnum {
  Normal,
  Fire,
  Fighting,
  Water,
  Flying,
  Grass,
  Poison,
  Electric,
  Ground,
  Psychic,
  Rock,
  Ice,
  Bug,
  Dragon,
  Ghost,
  Dark,
  Steel,
  Fairy,
  Other,
}

TypeColorEnum getPokemonType(String type) {
  switch (type) {
    case 'Normal':
      return TypeColorEnum.Normal;
    case 'Fire':
      return TypeColorEnum.Fire;
    case 'Fighting':
      return TypeColorEnum.Fighting;
    case 'Water':
      return TypeColorEnum.Water;
    case 'Flying':
      return TypeColorEnum.Flying;
    case 'Grass':
      return TypeColorEnum.Grass;
    case 'Poison':
      return TypeColorEnum.Poison;
    case 'Electric':
      return TypeColorEnum.Electric;
    case 'Ground':
      return TypeColorEnum.Ground;
    case 'Psychic':
      return TypeColorEnum.Psychic;
    case 'Rock':
      return TypeColorEnum.Rock;
    case 'Ice':
      return TypeColorEnum.Ice;
    case 'Bug':
      return TypeColorEnum.Bug;
    case 'Ghost':
      return TypeColorEnum.Ghost;
    case 'Dark':
      return TypeColorEnum.Dark;
    case 'Steel':
      return TypeColorEnum.Steel;
    case 'Fairy':
      return TypeColorEnum.Fairy;
    default:
      return TypeColorEnum.Other;
  }
}
