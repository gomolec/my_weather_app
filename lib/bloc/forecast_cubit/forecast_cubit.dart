import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_weather_app/bloc/search_bloc/location_bloc.dart';
import 'package:my_weather_app/models/models.dart';
import 'package:my_weather_app/repositories/forecast_repository.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final ForecastRepository _forecastRepository;
  final LocationBloc _locationBloc;
  late final StreamSubscription _locationBlocSubscription;

  ForecastCubit(
    this._forecastRepository,
    this._locationBloc,
  ) : super(ForecastInitial()) {
    _locationBlocSubscription = _locationBloc.stream.listen(
      (state) {
        if (state is LocationLoaded) {
          getForecast(lat: state.location.lat!, lon: state.location.lon!);
        }
      },
    );
  }

  void getForecast({required double lat, required double lon}) async {
    emit(ForecastLoading());
    try {
      final forecast =
          await _forecastRepository.getForecast(lat: lat, lon: lon);

      emit(ForecastLoaded(forecast));
    } catch (e) {
      emit(ForecastError());
    }
  }

  @override
  Future<void> close() {
    _locationBlocSubscription.cancel();
    return super.close();
  }
}
