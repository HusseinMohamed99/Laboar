import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/core/components/buttons.dart';
import 'package:laboar/core/cubit/registerCubit/register_cubit.dart';
import 'package:laboar/core/cubit/registerCubit/register_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: defaultButton(function: () {}, widget: const Text('SEND')),
          );
        },
      ),
    );
  }
}
