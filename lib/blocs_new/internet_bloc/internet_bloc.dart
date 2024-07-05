import 'dart:async';

import 'package:block_learning/blocs_new/internet_bloc/internet_event.dart';
import 'package:block_learning/blocs_new/internet_bloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubcription;

  InternetBloc() : super(InternetInitialState()) {
    // 'On' checks which events came to him
    on<InternetLostEvent>((event, emit) => emit(InternetlostState())); // here event is InternetLostEvent,emit is emitter which emit states
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    _connectivity.onConnectivityChanged.listen((result){
       if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubcription?.cancel();
    return super.close();
  }
}
