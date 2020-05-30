import 'dart:async';

import 'package:restaurantfinder/DataLayer/location.dart';
import 'package:restaurantfinder/DataLayer/restaurant.dart';
import 'package:restaurantfinder/DataLayer/zomato_client.dart';

import 'bloc.dart';

class RestaurantBloc implements Bloc {
  final Loc location;
  final _client = ZomatoClient();
  final _controller = StreamController<List<Restaurant>>();

  Stream<List<Restaurant>> get stream => _controller.stream;
  RestaurantBloc(this.location);

  void submitQuery(String query) async {
    final results = await _client.fetchRestaurants(location, query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
