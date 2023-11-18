part of 'booking_hotels_bloc.dart';

sealed class BookingHotelsEvent extends Equatable {
  const BookingHotelsEvent();

  @override
  List<Object> get props => [];
}

final class BookingStartedEvent extends BookingHotelsEvent {}

final class BookingFirstDesChangedEvent extends BookingHotelsEvent {
  final String? idDes;
  final bool isFirstDesValid;

  const BookingFirstDesChangedEvent({this.idDes, required this.isFirstDesValid});

  @override
  List<Object> get props => [idDes ?? '', isFirstDesValid];
}

final class BookingFirstDateChangedEvent extends BookingHotelsEvent {
  final DateTime firstDate;
  final bool isFristDateValid;

  const BookingFirstDateChangedEvent(
      {required this.firstDate, required this.isFristDateValid});

  @override
  List<Object> get props => [firstDate];
}

final class BookingSubmittedEvent extends BookingHotelsEvent {
  const BookingSubmittedEvent();
}
