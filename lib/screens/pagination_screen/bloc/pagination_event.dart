part of 'pagination_bloc.dart';

abstract class PaginationEvent extends Equatable {
  const PaginationEvent();

  @override
  List<Object> get props => [];
}
class PaginationIntialEvent extends PaginationEvent{}
class PaginationApiLoadedEvent extends PaginationEvent{}
