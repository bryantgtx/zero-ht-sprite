part of 'play_hand_bloc.dart';

abstract class PlayHandState extends Equatable {
  final PokerHand hand;
  const PlayHandState(this.hand);
  
  @override
  List<Object> get props => [hand, ];
}

class PlayHandInitial extends PlayHandState {
  const PlayHandInitial({PokerHand? hand}) : super(hand ?? const PokerHand());
}

class PlayHandBuildingHand extends PlayHandState {
  const PlayHandBuildingHand({PokerHand? hand}) : super(hand ?? const PokerHand());
}

