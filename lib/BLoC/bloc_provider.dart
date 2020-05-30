import 'package:flutter/material.dart';

import 'bloc.dart';
/*
you need a way to inject them into Flutter’s widget tree. It’s become a Flutter convention to call these types of widgets
 providers. A provider is a widget that stores data and well, “provides” it to all its children.
 */
// 1
class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key key, @required this.bloc, @required this.child})
      : super(key: key);
/*
BlocProvider is a generic class. The generic type T is scoped to be an object that implements the Bloc interface. This means
that the provider can only store BLoC objects.
 */
  // 2
  static T of<T extends Bloc>(BuildContext context) {
//    final type = _providerType<BlocProvider<T>>();
    final BlocProvider<T> provider = context.findAncestorWidgetOfExactType ();
    return provider.bloc;
  }

  // 3
//  static Type _providerType<T>() => T;

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  // 4
  @override
  Widget build(BuildContext context) => widget.child;

  // 5
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
    //When this widget is removed from the tree, Flutter will call the dispose method, which will in turn, close the stream.
  }
}
