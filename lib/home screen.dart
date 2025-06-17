import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    print("build");
    return Scaffold(
      appBar: AppBar(title: const Text("Counter App")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).search(value);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final search = ref.watch((searchProvider).select((state)=>state.search));
              print("Consumer called");
              return Text(
                search,
                style: TextStyle(fontSize: 30, color: Colors.red),
              );
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              final search = ref.watch((searchProvider).select((state)=>state.isChange));
              print("Consumer Switch called");
              return Switch(value: search, onChanged: (value){
                ref.read(searchProvider.notifier).onChange(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
