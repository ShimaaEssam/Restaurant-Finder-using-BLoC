import 'dart:async';
import 'dart:convert' show json;

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'location.dart';
import 'restaurant.dart';

class ZomatoClient {
  final _apiKey = '9b93a8a6872fe25aa86d3f7863b95f22';
  final _host = 'developers.zomato.com';
  final _contextRoot = 'api/v2.1';

  Future<List<Loc>> fetchLocations(String query) async {
    //https://developers.zomato.com/api/v2.1/locations?query=bali&count=10
    //https://developers.zomato.com/api/v2.1/search?query=a&count=10
    final results = await request(
        path: 'locations', parameters: {'query': query, 'count': '10'});

    final suggestions = results['location_suggestions'];
    return suggestions
        .map<Loc>((json) => Loc.fromJson(json))
        .toList();
  }

  Future<List<Restaurant>> fetchRestaurants(
      Loc location, String query) async {
    final results = await request(path: 'search', parameters: {
      'entity_id': location.id.toString(),
      'entity_type': location.type,
      'q': query,
      'count': '10'
    });

    final restaurants = results['restaurants']
        .map<Restaurant>((json) => Restaurant.fromJson(json['restaurant']))
        .toList();

    return restaurants;
  }
//https://developers.zomato.com/api/v2.1/locations?query=bali&count=10
  Future<Map> request(
      {@required String path, Map<String, String> parameters}) async {
    final uri = Uri.https(_host, '$_contextRoot/$path', parameters);
    final results = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  Map<String, String> get _headers =>
      {'Accept': 'application/json', 'user-key': _apiKey};
}
