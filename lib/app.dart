import 'package:candi_uap/bloc/bloc_provider.dart';
import 'package:candi_uap/bloc/game_bloc.dart';
import 'package:candi_uap/views/homepage.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameBloc>(
      bloc: GameBloc(),
      key: UniqueKey(),
      child: MaterialApp(
        title: 'Candi BOOM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}