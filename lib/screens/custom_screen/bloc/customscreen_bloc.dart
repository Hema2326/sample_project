import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'customscreen_event.dart';
part 'customscreen_state.dart';

class CustomscreenBloc extends Bloc<CustomscreenEvent, CustomscreenState> {
  CustomscreenBloc() : super(CustomscreenInitial()) {
    on<CustomscreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
