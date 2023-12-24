import 'package:candi_uap/bloc/bloc_provider.dart';
import 'package:candi_uap/bloc/game_bloc.dart';
import 'package:candi_uap/models/level.dart';
import 'package:candi_uap/models/objective.dart';
import 'package:candi_uap/widget/stream_objective_item.dart';
import 'package:flutter/material.dart';

class ObjectivePanel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final GameBloc? gameBloc = BlocProvider.of<GameBloc>(context);
    final Level level = gameBloc!.gameController.level;
    final Orientation orientation = MediaQuery.of(context).orientation;
    final EdgeInsets paddingTop = EdgeInsets.only(top: (orientation == Orientation.portrait ? 10.0 : 0.0));
    //
    // Build the objectives
    //
    List<Widget> objectiveWidgets = level.objectives.map((Objective obj){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: StreamObjectiveItem(objective: obj, key: UniqueKey(),),
      );
    }).toList();

    return Padding(
      padding: paddingTop,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300]?.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 5.0, color: Colors.black.withOpacity(0.5)),
        ),
        height: 80.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: objectiveWidgets,
        ),
      ),
    );
  }
}