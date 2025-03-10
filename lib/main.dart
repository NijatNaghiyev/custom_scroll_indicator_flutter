import 'package:custom_scroll_indicator_flutter/screen/contact_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainWidget());

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Scroll Indicator',
      builder: (context, child) => child!,
      home: const ContactScreen(),
    );
  }
}
