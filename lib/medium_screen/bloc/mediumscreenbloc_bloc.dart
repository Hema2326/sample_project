import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mediumscreenbloc_event.dart';
part 'mediumscreenbloc_state.dart';

class MediumscreenblocBloc extends Bloc<MediumscreenblocEvent, MediumscreenblocState> {
  MediumscreenblocBloc() : super(MediumscreenblocInitial()) {
    on<MediumscreenblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
