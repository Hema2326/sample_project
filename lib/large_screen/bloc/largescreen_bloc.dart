import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'largescreen_event.dart';
part 'largescreen_state.dart';

class LargescreenBloc extends Bloc<LargescreenEvent, LargescreenState> {
  LargescreenBloc() : super(LargescreenInitial()) {
    on<LargescreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
