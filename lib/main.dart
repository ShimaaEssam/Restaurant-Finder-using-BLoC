import 'package:flutter/material.dart';

import 'BLoC/bloc_provider.dart';
import 'BLoC/location_bloc.dart';
import 'UI/main_screen.dart';

void main() => runApp(MyApp());
/*
Adding widgets above the material app is a great way to add data that needs to be accessed from multiple screens.
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationBloc>(
      bloc: LocationBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Restaurant Finder',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: MainScreen(),
        ),
    );
  }
}
