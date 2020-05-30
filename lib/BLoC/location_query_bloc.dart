import 'dart:async';

import 'package:restaurantfinder/DataLayer/location.dart';
import 'package:restaurantfinder/DataLayer/zomato_client.dart';

import 'bloc.dart';

//finds locations.
class LocationQueryBloc implements Bloc {
  final _controller = StreamController<List<Loc>>();
  final _client = ZomatoClient();
  Stream<List<Loc>> get locationStream => _controller.stream;
/*
the method accepts a string and uses the ZomatoClient class from the starter project to fetch locations from the API.
This uses Dart’s async/await syntax to make  the code a bit cleaner. The results are then published to the stream.
 */
  void submitQuery(String query) async {
    // 1
    final results = await _client.fetchLocations(query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
