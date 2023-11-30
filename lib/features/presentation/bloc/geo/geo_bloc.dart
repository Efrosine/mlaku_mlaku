import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/datastate/datastate.dart';
import '../../../domain/entities/geo_ent.dart';
import '../../../domain/usecases/geo_usecase.dart';

part 'geo_event.dart';
part 'geo_state.dart';

class GeoBloc extends Bloc<GeoEvent, GeoState> {
  GeoBloc(this._getCityUseCase, this._getProvUseCase) : super(GeoInitial()) {
    on<GeoStartedEvent>(_onStartEvent);
    on<GeoProvChangedEvent>(_onProvChange);
  }
  final GetCityUseCase _getCityUseCase;
  final GetProvUseCase _getProvUseCase;

  FutureOr<void> _onStartEvent(GeoStartedEvent event, Emitter<GeoState> emit) async {
    final dataState = await _getProvUseCase();
    if (dataState is DataSuccess) {
      emit(GeoInitialState(optionsProv: dataState.data!));
      emit(GeoStandbyState());
    } else {
      emit(const GeoInitialState(optionsProv: []));
      emit(GeoStandbyState());
    }
  }

  FutureOr<void> _onProvChange(GeoProvChangedEvent event, Emitter<GeoState> emit) async {
    String? idProv = event.idProv;
    bool? isProvValid = event.isProvValid;
    if (isProvValid) {
      final dataState = await _getCityUseCase(params: idProv);
      if (dataState is DataSuccess) {
        emit(GeoProvChangedState(optionsCity: dataState.data!, isProvValid: isProvValid));
        emit(GeoStandbyState());
      } else {
        emit(GeoProvChangedState(optionsCity: [], isProvValid: isProvValid));
        emit(GeoStandbyState());
      }
    } else {
      emit(GeoProvChangedState(optionsCity: [], isProvValid: isProvValid));
      emit(GeoStandbyState());
    }
  }
}
