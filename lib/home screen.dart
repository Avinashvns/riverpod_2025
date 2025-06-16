import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// read a constant value and create a provider
final data = Provider<String>((ref){
  return "Avinash";
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return const Scaffold(body: Center(child: Text("Welcome")));
  }
}
