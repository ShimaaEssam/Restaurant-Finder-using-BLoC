import 'dart:async';

import 'package:restaurantfinder/DataLayer/location.dart';

import 'bloc.dart';
//responsible for managing the app’s selected location.
class LocationBloc implements Bloc {
  Loc _location;
  Loc get selectedLocation => _location;

  // 1
  final _locationController = StreamController<Loc>();
  /*Here a private StreamController is declared that will manage the stream and sink for this BLoC. StreamControllers use
  generics to tell the type system what kind of object will be emitted from the stream.
   */
  // 2
  Stream<Loc> get locationStream => _locationController.stream;

  // 3
  void selectLocation(Loc location) {
    _location = location;
    _locationController.sink.add(location);
  }
  /*
  This function represents the input for the BLoC. A Location model object will be provided as parameter that
   is cached in the object’s private _location property and then added to sink for the stream.
   */

  // 4
  @override
  void dispose() {
    _locationController.close();
  }
  /*
  Finally, in clean up method, the StreamController is closed when this object is deallocated. If you do not do this,
   the IDE will complain that the StreamController is leaking.
   */
}
