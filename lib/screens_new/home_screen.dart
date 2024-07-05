import 'package:block_learning/blocs_new/internet_bloc/internet_state.dart';
import 'package:block_learning/blocs_new/internet_bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
           /*  listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Connected!"),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetlostState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Connection Lost!"),
                backgroundColor: Colors.red,
              ));
            }
          }, */
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Connected!"),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetlostState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Connection Lost!"),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            print("$state");
            if (state is InternetGainedState) {
              print("$state : Connected");
              return const Text("Connected!");
            } else if (state is InternetlostState) {
              print("$state : Not Connected");
              return const Text("Not Connected!");
            } else {
               print("$state : Loading....");
              return const Text("Loading....");
            }
          }, 
          ),
        ),
      ),
    );
  }
}
