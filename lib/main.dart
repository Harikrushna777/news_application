import 'package:flutter/material.dart';
import 'package:news_application/utils/route_utils.dart';
import 'package:news_application/views/screens/detail_page.dart';
import 'package:news_application/views/screens/homepage.dart';
import 'package:news_application/views/screens/webpage.dart';
import 'package:provider/provider.dart';

import 'controllers/api_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.detailPage: (context) => const DetailPage(),
        MyRoutes.webPage: (context) => const WebPage(),
      },
    );
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiController(),
        )
      ],
      child: const MyApp(),
    ),
  );
}
