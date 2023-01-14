import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_call_api/bloc/user_bloc.dart';
import 'package:latihan_call_api/model/api_repo.dart';

import 'page/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiRepository apiRepository = ApiRepository();
    return RepositoryProvider(
      create: (context) => apiRepository,
      child: BlocProvider(
        create: (context) =>
            UserBloc(RepositoryProvider.of<ApiRepository>(context))
              ..add(LoadingUserEvent()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.green),
          home: HomePage(),
        ),
      ),
    );
  }
}
