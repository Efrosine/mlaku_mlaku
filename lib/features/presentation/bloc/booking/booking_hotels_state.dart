part of 'booking_hotels_bloc.dart';

final class BookingHotelsState extends Equatable {
  const BookingHotelsState(
      {this.isDesValid = false,
      this.firstDes = '',
      this.isValid = false,
      this.firstDate});
  final DateTime? firstDate;
  final String firstDes;
  final bool isDesValid;
  final bool isValid;

  BookingHotelsState copyWith({
    DateTime? firstDate,
    String? firstDes,
    bool? isDesValid,
    bool? isValid,
  }) {
    return BookingHotelsState(
      firstDate: firstDate ?? this.firstDate,
      isValid: isValid ?? this.isValid,
      firstDes: firstDes ?? this.firstDes,
      isDesValid: isDesValid ?? this.isDesValid,
    );
  }

  @override
  List<Object> get props => [isDesValid, isValid, firstDes, firstDate ?? ''];
}
