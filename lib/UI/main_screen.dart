

import 'package:flutter/material.dart';
import 'package:restaurantfinder/BLoC/bloc_provider.dart';
import 'package:restaurantfinder/BLoC/location_bloc.dart';
import 'package:restaurantfinder/DataLayer/location.dart';
import 'package:restaurantfinder/UI/restaurant_screen.dart';

import 'location_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Loc>(
      /*
      For the stream property, use the of method to retrieve the LocationBloc and add its stream to this StreamBuilder.
       */
      stream: BlocProvider.of<LocationBloc>(context).locationStream,
      builder: (context, snapshot) {
        final location = snapshot.data;

        if (location == null) {
          return LocationScreen();
        }

        return RestaurantScreen(location: location);
      }
    );
  }
}