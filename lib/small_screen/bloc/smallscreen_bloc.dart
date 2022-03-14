import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'smallscreen_event.dart';
part 'smallscreen_state.dart';

class SmallscreenBloc extends Bloc<SmallscreenEvent, SmallscreenState> {
  SmallscreenBloc() : super(SmallscreenInitial()) {
    on<SmallscreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
