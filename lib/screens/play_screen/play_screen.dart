import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/models/card.dart';
import 'package:test/screens/play_screen/play_hand/bloc/play_hand_bloc.dart';
import 'package:test/screens/play_screen/play_hand/play_hand.dart';
import 'package:test/theme_constants.dart';

class PlayScreen extends StatefulWidget {
  static const routeName = '/play';
  const PlayScreen({ Key? key }) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {

  @override
  Widget build(BuildContext context) {
    var prependButton = ElevatedButton(
      onPressed: () => 
        BlocProvider.of<PlayHandBloc>(context)
          .add(const PlayHandPrependCardEvent(Card(Suit.spades, Card.ace))), 
      child: const Text('Prepend'),
    );
    var appendButton = ElevatedButton(
      onPressed: () => 
        BlocProvider.of<PlayHandBloc>(context)
          .add(const PlayHandAppendCardEvent(Card(Suit.spades, Card.king))), 
      child: const Text('Append'),
    );
    var removeFirstButton = ElevatedButton(
      onPressed: () => 
        BlocProvider.of<PlayHandBloc>(context)
          .add(const PlayHandRemoveFirstCardEvent()), 
      child: const Text('Remove First'),
    );
    var removeLastButton = ElevatedButton(
      onPressed: () => 
        BlocProvider.of<PlayHandBloc>(context)
          .add(const PlayHandRemoveLastCardEvent()), 
      child: const Text('Remove Last'),
    );

    return Container(
      padding: const EdgeInsets.all(ThemeConstants.defaultScreenPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const PlayHand(),
          prependButton,
          appendButton,
          removeFirstButton,
          removeLastButton,
        ],
      ),
    );
  }
}
