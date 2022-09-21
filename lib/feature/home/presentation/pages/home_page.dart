import 'package:demo/feature/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Call API to get events Data.
    context.read<HomeCubit>().getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
          if (state.status == HomeStatus.failure) {
            // TODO: Show error message
            // Show failure (Alert Dialog/ Toast or Snackbar)
          }
        }, buildWhen: (context, state) {
          // Only rebuild the widget in case of API success/failure.
          return state.status == HomeStatus.success ||
              state.status == HomeStatus.failure;
        }, builder: (context, state) {
          if (state.status == HomeStatus.initial ||
              state.status == HomeStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            );
          } else {
            // This is to show data in case of successful response from the API.
            return Container();
          }
        }),
      ),
    );
  }
}
