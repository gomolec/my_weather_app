import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_weather_app/models/location.dart';
import 'package:my_weather_app/repositories/location_repository.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository _locationRepository;
  late Box savedLocationBox;

  LocationBloc(
    this._locationRepository,
  ) : super(const LocationInitial()) {
    on<LocationInitialEvent>(_onInitialLocationEvent);
    on<LocationQueried>(_onSearchLocationQueried);
    on<GeolocationStarted>(_onSearchGeolocationStarted);
    on<LocationSubmitted>(_onSearchLocationSubmitted);
  }

  void _onInitialLocationEvent(
    LocationInitialEvent event,
    Emitter<LocationState> emit,
  ) async {
    savedLocationBox = await Hive.openBox("savedLocationBox");
    final Location? savedLocation = savedLocationBox.get("savedLocation");

    if (savedLocation != null) {
      emit(LocationLoaded(location: savedLocation));
    }
  }

  void _onSearchLocationQueried(
      LocationQueried event, Emitter<LocationState> emit) async {
    try {
      final List<Location> responce =
          await _locationRepository.getNamedLocation(q: event.query);
      emit(LocationQuerried(responce: responce));
    } catch (error) {
      debugPrint("Error: $error");
      emit(LocationError(error: error.toString()));
    }
  }

  void _onSearchGeolocationStarted(
      GeolocationStarted event, Emitter<LocationState> emit) async {
    emit(const LocationLocating());
    try {
      final Position geolocation = await _determinePosition();
      final Location responce = await _locationRepository.getGeocodedLocation(
        lat: geolocation.latitude,
        lon: geolocation.longitude,
      );
      savedLocationBox.put("savedLocation", responce);
      emit(LocationLoaded(location: responce));
    } catch (error) {
      debugPrint("Error: $error");
      emit(LocationError(error: error.toString()));
    }
  }

  void _onSearchLocationSubmitted(
      LocationSubmitted event, Emitter<LocationState> emit) async {
    savedLocationBox.put("savedLocation", event.location);
    emit(LocationLoaded(location: event.location));
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
