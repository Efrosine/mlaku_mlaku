import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../bloc/booking/booking_hotels_bloc.dart';

class ListHotelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingHotelsBloc>(
      create: (context) => sl(),
      child: ListHotelsContent(),
    );
  }

  // Row _title(HotelModel hm) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Text('${hm.name}'),
  //       HotelsRating(
  //         rating: hm.rating,
  //       )
  //     ],
  //   );
  // }
}

class ListHotelsContent extends StatelessWidget {
  const ListHotelsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(fontSize: 14),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text( ?? 'Tidak terdefinisi'),
            // Text(
            //     '${reqBook.dateStartSring}, ${reqBook.duration} night(s) ${reqBook.gR!.rooms} room(s)'),
          ],
        ),
      ),
      body: BlocBuilder<BookingHotelsBloc, BookingHotelsState>(
          buildWhen: (previous, current) => current is BookingDateChangedState,
          builder: (context, state) {
            return GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width,
                mainAxisExtent: 265,
                mainAxisSpacing: 16,
              ),
              // itemCount: listHotels.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, '/DHPage', arguments: listHotels[index]);
                },
                child: GridTile(
                  child: Container(
                      // child: Image.asset(listHotels[index].imageUrls[0], fit: BoxFit.cover),
                      ),
                  footer: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // _title(listHotels[index]),
                        SizedBox(
                          height: 8,
                        ),
                        // LabelNStarWidget(countStar: listHotels[index].star),
                        SizedBox(
                          height: 8,
                        ),
                        // LocationNDistance(location: listHotels[index].location),
                        Divider(),
                        Align(
                          alignment: Alignment.bottomRight,
                          // child: Text(listHotels[index].getPrice),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
