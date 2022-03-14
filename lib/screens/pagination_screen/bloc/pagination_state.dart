part of 'pagination_bloc.dart';

abstract class PaginationState extends Equatable {
  const PaginationState();
  
  @override
  List<Object> get props => [];
}

class PaginationInitial extends PaginationState {}
class PaginationLoadingState extends PaginationState {}
class PaginationLoadedState extends PaginationState {}
class PaginationSucessState extends PaginationState {}
