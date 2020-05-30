

import 'package:flutter/material.dart';
import 'package:restaurantfinder/BLoC/bloc_provider.dart';
import 'package:restaurantfinder/BLoC/location_bloc.dart';
import 'package:restaurantfinder/BLoC/location_query_bloc.dart';
import 'package:restaurantfinder/DataLayer/location.dart';

class LocationScreen extends StatelessWidget {
  final bool isFullScreenDialog;
/*
The boolean is just a simple flag (that defaults to false) which will be used later to update the navigation
 behavior when a location is tapped.
 */
  const LocationScreen({Key key, this.isFullScreenDialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LocationQueryBloc();

    return BlocProvider<LocationQueryBloc>(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(title: Text('Where do you want to eat?')),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter a location'),
                onChanged: (query) => bloc.submitQuery(query),
              ),
            ),
            Expanded(
              child: _buildResults(bloc),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildResults(LocationQueryBloc bloc) {
    return StreamBuilder<List<Loc>>(
      stream: bloc.locationStream,
      builder: (context, snapshot) {

        // 1
        final results = snapshot.data;

        if (results == null) {
          return Center(child: Text('Enter a location'));
        }

        if (results.isEmpty) {
          return Center(child: Text('No Results'));
        }

        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(List<Loc> results) {
    // 2
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        final loc = results[index];
        return ListTile(
          title: Text(loc.title),
          onTap: () {
            final locationBloc = BlocProvider.of<LocationBloc>(context);
            locationBloc.selectLocation(loc);

            if (isFullScreenDialog) {
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

}
