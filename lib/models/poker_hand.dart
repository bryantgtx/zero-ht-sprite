import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:test/models/card.dart';

class PokerHand {
  static const IList<Card> initialHand = IListConst([]);

  final IList<Card> cards;

  const PokerHand({this.cards = initialHand});

  int get cardsInHand => cards.length;
  int get maxCards => 5;

  PokerHand addCard(Card newCard, bool front) {
    return cards.length < 5 
      ? PokerHand(cards: front ? cards.insert(0, newCard) : cards.add(newCard))
      : this;
  }

  PokerHand removeCard(bool front) {
    return cards.isNotEmpty 
      ? PokerHand(cards: front ? cards.removeAt(0) : cards.removeAt(cards.length-1))
      : this;
  }

  @override
  String toString() {
    var out = "";
    for (var card in cards) {
      out += "$card ";
    }
    return out.trimRight();
  }
  
}