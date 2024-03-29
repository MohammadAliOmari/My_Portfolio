import 'package:flutter/material.dart';

import 'package:portfolio1_project/layout/portfolio_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      title: "Mohamad'Omari",
      debugShowCheckedModeBanner: false,
      home: PortfolioLayout(),
    );
  }
}
