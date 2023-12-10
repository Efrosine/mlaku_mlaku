import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:mlaku_mlaku/features/presentation/bloc/booking/booking_hotels_bloc.dart';

import '../../widgets/hotels_rating_widget.dart';
import '../../widgets/label_star_widget.dart';

class DetailHotelsPage extends StatelessWidget {
  const DetailHotelsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingHotelsBloc>.value(
      value: BlocProvider.of<BookingHotelsBloc>(context),
      child: DetailHotelsPageContent(),
    );
  }
}

class DetailHotelsPageContent extends StatelessWidget {
  const DetailHotelsPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingHotelsBloc, BookingHotelsState>(
      listenWhen: (previous, current) => current is BookingNavigateToNextPage,
      listener: (context, state) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/main',
          ModalRoute.withName('/main'),
        );
      },
      buildWhen: (previous, current) => current is BookingDetailState,
      builder: (context, state) {
        print('current state is ${state.runtimeType}');
        if (state is BookingDetailState) {
          var entity = state.hotelsEntity!;
          return Scaffold(
            body: ListView(
              padding: EdgeInsets.only(bottom: 124),
              children: [
                Container(
                  width: double.infinity,
                  height: 260,
                  color: Colors.red,
                  child: Image.network(entity.image!, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entity.name!,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      LabelNStarWidget(countStar: entity.stars!),
                      // SizedBox(height: 8),
                      // LocationNDistance(location: entity.location),
                    ],
                  ),
                ),
                Divider(thickness: 2, height: 16),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ratings',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      HotelsRating(
                        rating: entity.rating ?? 0.0,
                        desc: 'Convinien',
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 2, height: 16),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        entity.description ?? 'null',
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottomSheet: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 8, spreadRadius: 1, color: Colors.blueGrey)
              ]),
              child: Container(
                height: 100,
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price'),
                        SizedBox(height: 4),
                        Text(
                          entity.getPrice,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xFFF56E09)),
                        ),
                        SizedBox(height: 4),
                        Text('Inclusive of Taxes'),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<BookingHotelsBloc>()
                            .add(BookingReservationEvent(entity: entity));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF56E09),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Purchase',
                        // style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
