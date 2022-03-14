import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_project/models/market.dart';
import 'package:sample_project/models/pagination_model.dart';
import 'package:sample_project/repository/repository.dart';

part 'pagination_event.dart';
part 'pagination_state.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  PaginationBloc() : super(PaginationInitial()) {
    int pageNo = 0;
  bool isFirstLoading = false;
  bool isLoading = false;
  bool hasNextPage = true;
  List<Market> marketList = [];
    on<PaginationEvent>((event, emit)async {
       if (event is PaginationIntialEvent) {
        emit.call(PaginationLoadingState());
        isFirstLoading = true;
        Map<String, dynamic> loadedResponse = await getListPage(pageNo);
        PaginationApimodel paginationApimodel =
            PaginationApimodel.fromJson(loadedResponse);
        marketList = paginationApimodel.markets ?? [];
        isFirstLoading = false;

        emit.call(PaginationSucessState());
      }

      if (event is PaginationApiLoadedEvent) {
        emit.call(PaginationLoadedState());
        hasNextPage = true;
        Map<String, dynamic> loadedResponse = await getListPage(pageNo);
        PaginationApimodel paginationApimodel =
            PaginationApimodel.fromJson(loadedResponse);
        marketList.addAll(paginationApimodel.markets ?? []);

        emit.call(PaginationSucessState());
        hasNextPage = false;
      }
    });
    
  }
}
