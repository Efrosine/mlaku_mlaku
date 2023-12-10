import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlaku_mlaku/features/domain/entities/hotels_ent.dart';

import '../../bloc/booking/booking_hotels_bloc.dart';
import '../../widgets/hotels_rating_widget.dart';
import '../../widgets/label_star_widget.dart';

class ListHotelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingHotelsBloc>.value(
      value: BlocProvider.of<BookingHotelsBloc>(context),
      child: ListHotelsContent(),
    );
  }
}

class ListHotelsContent extends StatelessWidget {
  const ListHotelsContent({
    super.key,
  });

  Row _title(HotelsEntity hm) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            '${hm.name}',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        HotelsRating(
          rating: hm.rating ?? 0.0,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          titleTextStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          title: Text('Pencarian Hotel')),
      body: BlocConsumer<BookingHotelsBloc, BookingHotelsState>(
        listenWhen: (previous, current) => current is BookingNavigateToNextPage,
        listener: (context, state) {
          Navigator.pushNamed(context, '/DHPage');
        },
        buildWhen: (previous, current) => current is BookingSearchedState,
        builder: (context, state) {
          var listHotels = state.listHotels ?? [];
          return GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width,
              mainAxisExtent: 265,
              mainAxisSpacing: 16,
            ),
            itemCount: listHotels.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                context
                    .read<BookingHotelsBloc>()
                    .add(BookingClickedItemEvent(entity: listHotels[index]));
              },
              child: GridTile(
                child: Card(
                  elevation: 4,
                  child: Image.network(listHotels[index].image!, fit: BoxFit.cover),
                ),
                footer: Container(
                  color: Colors.blueGrey[50],
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _title(listHotels[index]),
                      SizedBox(height: 4),
                      LabelNStarWidget(countStar: listHotels[index].stars ?? 0),
                      SizedBox(height: 8),
                      // LocationNDistance(location: listHotels[index].location),
                      Divider(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          listHotels[index].getPrice,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xFFF56E09)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
