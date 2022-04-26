part of 'play_hand_bloc.dart';

abstract class PlayHandEvent extends Equatable {
  const PlayHandEvent();

  @override
  List<Object> get props => [];
}

class PlayHandStartEvent extends PlayHandEvent {
  const PlayHandStartEvent() : super();
}

class PlayHandPrependCardEvent extends PlayHandEvent {
  final Card card;
  const PlayHandPrependCardEvent(this.card) : super();
}

class PlayHandAppendCardEvent extends PlayHandEvent {
  final Card card;
  const PlayHandAppendCardEvent(this.card) : super();
}

class PlayHandRemoveFirstCardEvent extends PlayHandEvent {
  const PlayHandRemoveFirstCardEvent() : super();
}


class PlayHandRemoveLastCardEvent extends PlayHandEvent {
  const PlayHandRemoveLastCardEvent() : super();
}
