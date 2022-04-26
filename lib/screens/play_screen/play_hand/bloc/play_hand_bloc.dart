import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test/models/card.dart';
import 'package:test/models/poker_hand.dart';

part 'play_hand_event.dart';
part 'play_hand_state.dart';

class PlayHandBloc extends Bloc<PlayHandEvent, PlayHandState> {
  PlayHandBloc() : super(const PlayHandInitial()) {
    on<PlayHandStartEvent>(_onStart);
    on<PlayHandPrependCardEvent>(_onPrepend);
    on<PlayHandAppendCardEvent>(_onAppend);
    on<PlayHandRemoveFirstCardEvent>(_onRemoveFirst);
    on<PlayHandRemoveLastCardEvent>(_onRemoveLast);
  }

  void _onStart(PlayHandStartEvent event, Emitter<PlayHandState> emit) {
    emit(const PlayHandBuildingHand(hand: PokerHand()));
  }

  void _onPrepend(PlayHandPrependCardEvent event, Emitter<PlayHandState> emit) {
    if (state is PlayHandBuildingHand) {
      emit(PlayHandBuildingHand(hand: state.hand.addCard(event.card, true)));
    }
  }

  void _onAppend(PlayHandAppendCardEvent event, Emitter<PlayHandState> emit) {
    if (state is PlayHandBuildingHand) {
      emit(PlayHandBuildingHand(hand: state.hand.addCard(event.card, false)));
    }
  }

  void _onRemoveFirst(PlayHandRemoveFirstCardEvent event, Emitter<PlayHandState> emit) {
    if (state is PlayHandBuildingHand) {
      emit(PlayHandBuildingHand(hand: state.hand.removeCard(true)));
    }
  }

  void _onRemoveLast(PlayHandRemoveLastCardEvent event, Emitter<PlayHandState> emit) {
    if (state is PlayHandBuildingHand) {
      emit(PlayHandBuildingHand(hand: state.hand.removeCard(false)));
    }
  }
}
