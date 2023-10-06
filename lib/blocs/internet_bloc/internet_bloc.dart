import 'package:block_learning/blocs/internet_bloc/internet_event.dart';
import 'package:block_learning/blocs/internet_bloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();

  // inside super we have to add initial state
  InternetBloc() : super(InternetInitialState()) {
    //On check events which one come to him
    on<InternetLostEvent>((event, emit) => emit(InternetlostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    // Add listener to _connectivity
    _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
}
