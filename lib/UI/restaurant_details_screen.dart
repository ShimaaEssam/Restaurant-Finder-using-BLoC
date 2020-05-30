

import 'package:flutter/material.dart';
import 'package:restaurantfinder/DataLayer/restaurant.dart';

import 'image_container.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailsScreen({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(restaurant.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildBanner(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  restaurant.cuisines,
                ),
                Text(
                  restaurant.address,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
          _buildDetails(context),
//          _buildFavoriteButton(context)
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return ImageContainer(
      height: 200,
      url: restaurant.imageUrl,
    );
  }

  Widget _buildDetails(BuildContext context) {
    final style = TextStyle(fontSize: 16);

    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Price: ${restaurant.priceRange}',
            style: style,
          ),
          SizedBox(width: 40),
          Text(
            'Rating: ${restaurant.rating.average}',
            style: style,
          ),
        ],
      ),
    );
  }

}
