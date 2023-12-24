import 'package:candi_uap/helpers/audio.dart';
import 'package:flutter/material.dart';
import 'package:candi_uap/app.dart';
import 'package:flutter/services.dart';

void main() async {
  await Audio.init();

  SystemChrome.setSystemUIOverlayStyle([] as SystemUiOverlayStyle);
  return runApp(
    Application(),);
}

