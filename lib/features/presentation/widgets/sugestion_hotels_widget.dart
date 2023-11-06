import 'package:flutter/material.dart';

// import '../../data/models/hotel_model.dart';
import 'hotels_rating_widget.dart';

class SugestionHotelsWidget extends StatelessWidget {
  const SugestionHotelsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(201),
      child: ListView.separated(
        // itemCount: listHotels.length,
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(
          width: 16,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: EdgeInsets.only(bottom: 4),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 165,
                    height: 100,
                    color: Colors.red,
                    // child: Image.asset(
                    //   listHotels[index].imageUrls[0],
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // listHotels[index].name,
                          index.toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        // HotelsRating(rating: listHotels[index].rating),
                        SizedBox(
                          height: 4,
                        ),
                        // Text(listHotels[index].getPrice),
                      ],
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 50,
                  height: 20,
                  color: Colors.black54,
                  child: Center(
                    child: Text(
                      'Malang',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_outline,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
