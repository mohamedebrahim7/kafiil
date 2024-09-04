import 'package:flutter_bloc/flutter_bloc.dart';

import 'logger.dart';

class MyCubitObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    log.i('Cubit created: ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log.i('Error in ${bloc.runtimeType}: $error');
  }

  @override
  void onClose(BlocBase bloc) {
    log.i('Cubit closed: ${bloc.runtimeType}');
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log.i('State changed in ${bloc.runtimeType} \n from: ${change.currentState} \n to: ${change.nextState}');
  }
}
