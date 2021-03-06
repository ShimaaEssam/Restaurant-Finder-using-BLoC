abstract class Bloc {
  void dispose();
}
/*
All of your BLoC classes will conform to this interface. The interface doesn’t do much except force you to add
a dispose method. One small caveat that needs to be kept in mind with streams is that they need to be closed when
they are no longer needed, otherwise it can cause a memory leak. The dispose method is where the app will check for this.
 */