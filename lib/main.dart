import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/bloc/bloc_observer.dart';
import 'package:to_do_app/data/bloc/cubit.dart';
import 'package:to_do_app/data/bloc/states.dart';
import 'package:to_do_app/data/notification.dart';
import 'package:to_do_app/screens/board/board_screen.dart';
import 'package:to_do_app/shared/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationServices().initializeNotification();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc()..createDatabase(),
      child: BlocConsumer<AppBloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: Themes.lightTheme,
            home: const BoardScreen(),
          );
        },
      ),
    );
  }
}
