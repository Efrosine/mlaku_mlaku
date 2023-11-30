part of 'geo_bloc.dart';

sealed class GeoState extends Equatable {
  const GeoState({
    this.idProv = '',
    this.isProvValid = false,
    this.optionsProv,
    this.optionsCity,
  });
  final String idProv;
  final bool isProvValid;
  final List<GeoEntity>? optionsProv, optionsCity;
  @override
  List<Object> get props => [
        idProv,
        isProvValid,
        optionsProv ?? [],
        optionsCity ?? [],
      ];
}

final class GeoInitial extends GeoState {}

final class GeoInitialState extends GeoState {
  const GeoInitialState({
    required super.optionsProv,
  });
}

final class GeoProvChangedState extends GeoState {
  const GeoProvChangedState({
    required super.optionsCity,
    required super.isProvValid,
  });
}

final class GeoStandbyState extends GeoState {}
