import 'package:flutter/material.dart';
import 'package:mlaku_mlaku/features/data/datasources/firebase/firestore_service.dart';
import 'package:mlaku_mlaku/features/data/model/hotel_model.dart';

import '../../widgets/hotels_rating_widget.dart';
import '../../widgets/label_star_widget.dart';
import '../../widgets/location_distance_widget.dart';

class SavedPage extends StatelessWidget {
  final db = FirestoreService();
  SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved'),
      ),
      body: FutureBuilder(
        future: db.getAllData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              // return ListView.builder(
              //   itemCount: snapshot.data!.length,
              //   itemBuilder: (context, index) => Text(snapshot.data![index].name),
              // );
              return GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width,
                  mainAxisExtent: 265,
                  mainAxisSpacing: 16,
                ),
                itemCount: snapshot.data!.length,
                // itemCount: 0,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, '/LHPage', arguments: bookedHotels[index]);
                  },
                  child: GridTile(
                    child: Container(
                      child: Image.network(
                        snapshot.data![index].imageUrls,
                        // '',
                        fit: BoxFit.cover,
                      ),
                    ),
                    footer: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _title(snapshot.data![index]),
                          SizedBox(
                            height: 8,
                          ),
                          // LabelNStarWidget(countStar: snapshot.data![index].star),
                          SizedBox(
                            height: 8,
                          ),
                          // LocationNDistance(location: snapshot.data![index].location),
                          Divider(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(snapshot.data![index].getPrice),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: Text('kosong'));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Row _title(HotelModel hm) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisSize: MainAxisSize.max,
      children: [
        Text('${hm.name}'),
        HotelsRating(
          rating: hm.rating,
        )
      ],
    );
  }
}
