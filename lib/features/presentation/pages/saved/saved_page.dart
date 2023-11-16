import 'package:cloud_firestore/cloud_firestore.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    String? imageUrl, name, location, desc;
                    int? price;
                    return Dialog(
                      //create from field for fill hotels data

                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              onChanged: (value) => imageUrl = value,
                              decoration: InputDecoration(
                                labelText: 'Image Urls',
                              ),
                            ),
                            TextField(
                              onChanged: (value) => name = value,
                              decoration: InputDecoration(
                                labelText: 'Name',
                              ),
                            ),
                            TextField(
                              onChanged: (value) => location = value,
                              decoration: InputDecoration(
                                labelText: 'Location',
                              ),
                            ),
                            TextField(
                              onChanged: (value) => desc = value,
                              decoration: InputDecoration(
                                labelText: 'Desc',
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) => price = int.parse(value),
                              decoration: InputDecoration(
                                labelText: 'Price',
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  db.addData(HotelModel(
                                    imageUrls: imageUrl!,
                                    name: name!,
                                    location: location!,
                                    desc: desc!,
                                    price: price!,
                                    rating: 4.5,
                                    star: 4,
                                  ));
                                  Navigator.pop(context);
                                },
                                child: Text('Save'))
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: StreamBuilder(
        stream: db.getDocHotels(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              // return ListView.builder(
              //   itemCount: hasil.length,
              //   itemBuilder: (context, index) => Text(hasil[index].name),
              // );
              // print(snapshot.data![0].id);
              // print(snapshot.g);
              List<QueryDocumentSnapshot<Object?>> userList = snapshot.data!.docs;
              var doc = snapshot.data!;
              return GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width,
                  mainAxisExtent: 265,
                  mainAxisSpacing: 16,
                ),
                itemCount: userList.length,
                // itemCount: 0,
                itemBuilder: (context, index) {
                  DocumentSnapshot docSnap = userList[index];
                  HotelModel hm = HotelModel.fromDocumentSnapshot(docSnap);
                  return InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, '/LHPage', arguments: bookedHotels[index]);
                    },
                    child: GridTile(
                      child: Container(
                        child: Image.network(
                          hm.imageUrls,
                          // '',
                          fit: BoxFit.cover,
                        ),
                      ),
                      header: Row(children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  String? name;
                                  return Dialog(
                                      child: Container(
                                    child: Column(
                                      children: [
                                        TextField(
                                          onChanged: (value) => name = value,
                                          decoration: InputDecoration(
                                            labelText: 'Name',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              db.updateData(
                                                  userList[index].id, {'name': name});
                                              Navigator.pop(context);
                                            },
                                            child: Text('Save')),
                                      ],
                                    ),
                                  ));
                                },
                              );
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              db.deleteData(userList[index].id);
                            },
                            icon: Icon(Icons.delete)),
                      ]),
                      footer: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _title(hm),
                            SizedBox(
                              height: 8,
                            ),
                            // LabelNStarWidget(countStar: hm.star),
                            SizedBox(
                              height: 8,
                            ),
                            // LocationNDistance(location: hm.location),
                            Divider(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(hm.getPrice),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text('kosong'));
            }
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
