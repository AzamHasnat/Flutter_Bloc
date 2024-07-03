import 'package:block_learning/blocs/internet_bloc/internet_bloc.dart';
import 'package:block_learning/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenN extends StatelessWidget {
  const HomeScreenN({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Connected!");
            } else if (state is InternetlostState) {
              return const Text("Not Connected!");
            } else {
              return const Text("Connecteddddd");
            }
          },
        ),
      ),
    ));
  }
}
