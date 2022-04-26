import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/common_assets.dart';
import 'package:test/screens/play_screen/play_hand/bloc/play_hand_bloc.dart';
import 'package:test/models/card.dart';

class PlayHand extends StatefulWidget {
  const PlayHand({Key? key}) : super(key: key);

  @override
  State<PlayHand> createState() => _PlayHandState();
}

class _PlayHandState extends State<PlayHand> {
  @override

  // The PlaceHolder cards from Image.asset appear normally, but any SpriteWidgets have a height of zero.
  // use either prepend or append to add a card, and you'll see a blank space with the correct width.
  // note that prepend/append are adding to the cards in the hand.  The display always shows a total of
  // five "things", either the cards in the hand or the placeholder.  (i.e. Append doesn't add to position five,
  // but as the last card in the hand)
  Widget build(BuildContext context) {

    Widget cardWidget(int index, PlayHandState state) {
      final Card? card = index < state.hand.cardsInHand ? state.hand.cards[index] : null;
      final Widget graphic = card != null
        ? CommonAssets.getCardFace(card)
        : Image.asset(CommonAssets.cardPlaceholder);
      return Expanded(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: graphic
        ),
      );
    }

    return BlocBuilder<PlayHandBloc, PlayHandState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(state.hand.maxCards, (index) => cardWidget(index, state)),
          ),
        );
      }
    );
  }

  // Gridview shows the cards, but try the following sequence:
  // Prepend, append, append, remove first.  Note that the actual cards in the hand are printed in the
  // debug console, and they do not match what is on the screen.
  // Do a hot refresh, and they will.
  // Widget build(BuildContext context) {

  //   Widget cardWidget(int index, PlayHandState state) {
  //     final Card? card = index < state.hand.cardsInHand ? state.hand.cards[index] : null;
  //     final Widget graphic = card != null
  //       ? CommonAssets.getCardFace(card)
  //       : Image.asset(CommonAssets.cardPlaceholder);
  //     return Container(
  //       padding: const EdgeInsets.all(5.0),
  //       child: graphic
  //     );
  //   }

  //   return BlocBuilder<PlayHandBloc, PlayHandState>(
  //     builder: (context, state) {
  //       print('showing hand ${state.hand}');
  //       return Container(
  //         margin: const EdgeInsets.only(left: 5.0, right: 5.0),
  //         padding: const EdgeInsets.all(5.0),
  //         child: GridView.count(
  //           crossAxisCount: state.hand.maxCards,
  //           crossAxisSpacing: 5,
  //           mainAxisSpacing: 5,
  //           shrinkWrap: true,
  //           childAspectRatio: .75,
  //           children: List.generate(state.hand.maxCards, (index) => cardWidget(index, state)),
  //         ),
  //       );
  //     }
  //   );
  // }
}