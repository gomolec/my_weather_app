part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchGeolocationStarted extends SearchEvent {
  const SearchGeolocationStarted();

  @override
  List<Object> get props => [];
}

class SearchLocationQueried extends SearchEvent {
  final String querry;

  const SearchLocationQueried({
    required this.querry,
  });

  @override
  List<Object> get props => [querry];
}

class SearchLocationSubmitted extends SearchEvent {
  final Location location;

  const SearchLocationSubmitted({
    required this.location,
  });

  @override
  List<Object> get props => [location];
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
