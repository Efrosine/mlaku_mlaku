part of 'geo_bloc.dart';

sealed class GeoEvent extends Equatable {
  const GeoEvent();

  @override
  List<Object> get props => [];
}

final class GeoStartedEvent extends GeoEvent {}

final class GeoProvChangedEvent extends GeoEvent {
  final String? idProv;
  final bool isProvValid;

  const GeoProvChangedEvent({this.idProv, required this.isProvValid});

  @override
  List<Object> get props => [idProv ?? '', isProvValid];
}
