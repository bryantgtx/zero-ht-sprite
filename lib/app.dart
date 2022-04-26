import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/screens/play_screen/play_hand/bloc/play_hand_bloc.dart';
import 'package:test/screens/play_screen/play_screen.dart';
import 'package:test/theme_constants.dart';

class TestApp extends StatelessWidget {
  TestApp({Key? key}) : super(key: key);

   final List<BlocProvider> providers = [
    BlocProvider<PlayHandBloc>(create: (_) => PlayHandBloc()..add(const PlayHandStartEvent()),),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);  // full screen

    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp(
        title: "test",
        home: const PlayScreen(),
        theme: ThemeConstants.theme,
      ),
    );
  }
}