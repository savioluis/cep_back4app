import 'package:flutter/material.dart';
import 'package:viacep_back4app/pages/home_page.dart';

void main() {
  runApp(const ViaCepBack4Ap());
}

class ViaCepBack4Ap extends StatelessWidget {
  const ViaCepBack4Ap({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ViaCep-Back4App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}
