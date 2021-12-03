import 'package:flutter/material.dart';
import 'package:movies_app/presintation/screens/home_view.dart';
import 'package:provider/provider.dart';

import 'domain/movies_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Movies(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('mainbuild====>MainBuild');
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
