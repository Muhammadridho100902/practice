import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_call_api/bloc/user_bloc.dart';
import 'package:latihan_call_api/model/user_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.e});

  final UserModel e;

  @override
  Widget build(BuildContext context) {
    UserBloc myBloc = context.read<UserBloc>();
    return Scaffold(
      body: BlocBuilder(
        bloc: myBloc,
        builder: (context, state) {
          if (state is UserLoadinState) {
            return const Center(child: CircularProgressIndicator(),);
          }

          if (state is UserLoadedState) {
            return Center(child: Text(e.first_name));
          }

          if (state is UserLoadedError) {
            return const Center(child: Text("Somthing error"));
          }

          return Container();
        },
      ),
    );
  }
}
