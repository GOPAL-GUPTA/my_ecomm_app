
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grk_001/Constants/constants.dart';

class RateUs extends StatelessWidget {
  static const String routename = 'rateus';
  @override
  Widget build(BuildContext context) {
//    final loggedinuser =
//        ModalRoute.of(context).settings.arguments as FirebaseUser;
    return Scaffold(
        appBar: AppBar(
          title: Text('Rate Us'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: RatingBar(
                  ratingWidget: RatingWidget(
                    full: Icon(
                      Icons.star,
                      color: Color(0XFFFF4081),
                    ),
                    empty: Icon(
                      Icons.star_border,
                      color: Color(0XFFFF4081),
                    ),
                    half: Icon(
                      Icons.star_half,
                      color: Color(0XFFFF4081),
                    ),
                  ),
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
//          itemBuilder: (context, _) => Icon(
//            Icons.star,
//            color: Color(0XFFFF4081),
//          ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  maxLines: 5,
                  decoration: ktextfielddecoration2.copyWith(
                      labelText: 'Any Suggestion ?'),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  maxLines: 5,
                  decoration: ktextfielddecoration2.copyWith(
                      labelText: 'Write a review'),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  maxLines: 5,
                  decoration: ktextfielddecoration2.copyWith(
                      labelText: 'Any Complaint ?'),
                ),
              )
            ],
          ),
        ));
  }
}
