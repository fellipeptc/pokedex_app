import 'dart:ui';

const List<String> typesPokemon = [
  "bug",
  "dark",
  "dragon",
  "electric",
  "fairy",
  "fighting",
  "fire",
  "flying",
  "ghost",
  "grass",
  "ground",
  "ice",
  "normal",
  "poison",
  "psychic",
  "rock",
  "steel",
  "water"
];

class TypesPokemon {

  static Color colorBack(String type) {
    if (type == 'bug') return Color(0xFF3c9950);
    if (type == 'dark') return Color(0xFF595978);
    if (type == 'dragon') return Color(0xFF62cad9);
    if (type == 'electric') return Color(0xFFfafa72);
    if (type == 'fairy') return Color(0xFFe91368);
    if (type == 'fighting') return Color(0xFFef6239);
    if (type == 'fire') return Color(0xFFfd4b5a);
    if (type == 'flying') return Color(0xFF94b2c7);
    if (type == 'ghost') return Color(0xFF906791);
    if (type == 'grass') return Color(0xFF27cb50);
    if (type == 'ground') return Color(0xFF6e491f);
    if (type == 'ice') return Color(0xFFd8f0fa);
    if (type == 'normal') return Color(0xFFca98a6);
    if (type == 'poison') return Color(0xFF9b69da);
    if (type == 'psychic') return Color(0xFFf71d92);
    if (type == 'rock') return Color(0xFF8b3e22);
    if (type == 'steel') return Color(0xFF42be94);
    if (type == 'water') return Color(0xFF85a8fb);
    return Color(0xFFe6e6e6);
  }

  static Color colorText(String type) {
    if (type == 'bug') return Color(0xFF1c4b27);
    if (type == 'dark') return Color(0xFF040707);
    if (type == 'dragon') return Color(0xFF448a95);
    if (type == 'electric') return Color(0xFFe2e32b);
    if (type == 'fairy') return Color(0xFF961a45);
    if (type == 'fighting') return Color(0xFF994025);
    if (type == 'fire') return Color(0xFFab1f24);
    if (type == 'flying') return Color(0xFF4a677d);
    if (type == 'ghost') return Color(0xFF33336b);
    if (type == 'grass') return Color(0xFF147b3d);
    if (type == 'ground') return Color(0xFFa8702d);
    if (type == 'ice') return Color(0xFF86d2f5);
    if (type == 'normal') return Color(0xFF75525c);
    if (type == 'poison') return Color(0xFF5e2d89);
    if (type == 'psychic') return Color(0xFFa52a6c);
    if (type == 'rock') return Color(0xFF48190b);
    if (type == 'steel') return Color(0xFF60756e);
    if (type == 'water') return Color(0xFF1552e1);
    return Color(0xFFe6e6e6);
  }
}
