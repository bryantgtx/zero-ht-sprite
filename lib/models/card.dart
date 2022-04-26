import 'package:equatable/equatable.dart';

enum Suit { spades, diamonds, clubs, hearts, }
enum CardState { faceUp, faceDown, }

class Card extends Equatable {
  static const minValue = 2;
  static const maxValue = 14;
  static const jack = 11;
  static const queen = 12;
  static const king = 13;
  static const ace = 14;
  final Suit suit;
  final int value;

  const Card(this.suit, this.value);

  String valueChar() {
    if ((value > 1) && (value < 11)) {
      return value.toString().padLeft(2);
    }
    else if (value == jack) {
      return ' J';
    }
    else if (value == queen) {
      return ' Q';
    }
    else if (value == king) {
      return ' K';
    }
    else if (value == ace) {
      return ' A';
    }
    return ' U';
  }

// returns the upper case first letter of the card's suit
  String suitChar() {
    var parts = suit.toString().split('.');
    return parts[1].substring(0,1).toUpperCase();
  }

  @override
  String toString() {
    final face = valueChar();
    final suit = suitChar();
    return '$face$suit';
  }

  @override
  List<Object> get props => [value, suit, ];
}