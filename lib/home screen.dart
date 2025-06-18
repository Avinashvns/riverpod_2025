import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_2025/future_provider/future_provider.dart';
import 'package:riverpod_2025/item_provider.dart';
import 'package:riverpod_2025/provider/favourite_provider.dart';
import 'package:riverpod_2025/search_provider.dart';
import 'package:riverpod_2025/slider_provider.dart';

// create a State Provider because change the state
final counter = StateProvider<int>((ref) {
  return 0;
});

final myswitch = StateProvider<bool>((ref) {
  return false;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    print("build");
    return Scaffold(
      appBar: AppBar(title: const Text("Future Provider"),
     ),


      body: Center(
        child: provider.when(
          data: (value)=> Text(value.toString()),
          error: (error,stack) => Text(error.toString()),
          loading: ()=> const CircularProgressIndicator()
        ),
      ),
    );
  }
}
