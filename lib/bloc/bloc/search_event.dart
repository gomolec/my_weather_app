part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchQueried extends SearchEvent {
  final String querry;

  const SearchQueried({
    required this.querry,
  });

  @override
  List<Object> get props => [querry];
}

class SearchLocate extends SearchEvent {
  const SearchLocate();

  @override
  List<Object> get props => [];
}
