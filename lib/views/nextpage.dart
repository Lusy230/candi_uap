import 'package:candi_uap/animations/shine_effect.dart';
import 'package:candi_uap/bloc/bloc_provider.dart';
import 'package:candi_uap/bloc/game_bloc.dart';
import 'package:candi_uap/models/level.dart';
import 'package:candi_uap/views/gamepage.dart';
import 'package:candi_uap/widget/game_level_button.dart';
import 'package:candi_uap/widget/shadowed_text.dart';
import 'package:flutter/material.dart';

import '../widget/double_curved_container.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )
      ..addListener(() {
        setState(() {});
      });

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.6,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GameBloc? gameBloc = BlocProvider.of<GameBloc>(context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = mediaQueryData.size;
    double levelsWidth = -100.0 + ((mediaQueryData.orientation == Orientation.portrait) ? screenSize.width : screenSize.height);

    return Scaffold(
      body: WillPopScope(
        // No way to get back
        onWillPop: () async => false,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Wallpaper.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShadowedText(
                  text: 'by Didier Boelens',
                  color: Colors.white,
                  fontSize: 12.0,
                  offset: Offset(1.0, 1.0), key: UniqueKey(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  width: levelsWidth,
                  height: levelsWidth,
                  child: GridView.builder(
                    itemCount: gameBloc?.numberOfLevels,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.01,
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return GameLevelButton(
                        width: 80.0,
                        height: 60.0,
                        borderRadius: 50.0,
                        text: 'Level ${index + 1}',
                        onTap: () async {
                          Level? newLevel = await gameBloc?.setLevel(index + 1);

                          // Open the Game page
                          Navigator.of(context).push(GamePage.route(newLevel!));
                        }, key: UniqueKey(),
                      );
                    },
                  ),
                ),
              ), 
            ),
            Positioned(
              left: 0.0,
              top: _animation.value * 250.0 - 150.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: DoubleCurvedContainer(
                  width: screenSize.width - 60.0,
                  height: 150.0,
                  outerColor: const Color.fromRGBO(33, 150, 243, 1),
                  innerColor: Colors.blue,
                  key: UniqueKey(),
                  child: Stack(
                    children: <Widget>[
                      ShineEffect(
                        offset: Offset(100.0, 100.0), key: UniqueKey(),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ShadowedText(
                          text: 'Candi BOOM',
                          color: Colors.white,
                          fontSize: 26.0,
                          shadowOpacity: 1.0,
                          offset: Offset(1.0,1.0), key: UniqueKey(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
