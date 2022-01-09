import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import 'package:my_weather_app/models/location.dart';
import 'package:my_weather_app/repositories/location_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final LocationRepository _locationRepository;

  SearchBloc(
    this._locationRepository,
  ) : super(const SearchState()) {
    on<SearchQueried>(_onSearchQuerried);
    on<SearchLocate>(_onSearchLocate);
  }

  void _onSearchQuerried(SearchQueried event, Emitter<SearchState> emit) async {
    try {
      final List<Location> responce =
          await _locationRepository.getNamedLocation(q: event.querry);
      emit(state.copyWith(responce: responce));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
    }
  }

  void _onSearchLocate(SearchLocate event, Emitter<SearchState> emit) async {
    try {
      final Position geolocation = await _determinePosition();
      final Location responce = await _locationRepository.getGeocodedLocation(
        lat: geolocation.latitude,
        lon: geolocation.longitude,
      );
      emit(state.copyWith(responce: [responce]));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
