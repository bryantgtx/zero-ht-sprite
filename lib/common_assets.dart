import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flame/widgets.dart';
import 'package:test/models/card.dart';

class CommonAssets {
  static get cardPlaceholder => 'assets/images/cardBack_blue3.png';
  static get _cardFrontSpriteSheet => 'Playing-Card-Sprites.png';

  static SpriteSheet? _cardSprites;
  static SpriteSheet? _cardBackSprites;
  static Future<void> initSpriteSheets() async {
    _cardSprites = SpriteSheet(
      image: await Flame.images.load(_cardFrontSpriteSheet), 
      srcSize: Vector2(140.0, 190.0),
    );
  }
  static SpriteSheet? get cardSprites => _cardSprites;
  static SpriteSheet? get cardBackSprites => _cardBackSprites;
  static SpriteWidget getCardFace(Card card) =>
    SpriteWidget(sprite: cardSprites!.getSprite(card.value-2, card.suit.index));

}