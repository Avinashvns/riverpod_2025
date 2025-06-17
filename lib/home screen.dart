import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_2025/item_provider.dart';
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
    final item = ref.watch(itemProvider);
    print("build");
    return Scaffold(
      appBar: AppBar(title: const Text("Counter App")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem('New Item');
        },
        child: const Icon(Icons.add),
      ),
      body:
          item.isEmpty
              ? Center(child: Text("No Data"))
              : ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  final itemDetails = item[index];
                  return ListTile(
                    title: Text(itemDetails.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: (){
                            ref.read(itemProvider.notifier).updateItem(itemDetails.id , "updated item");
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: (){
                            ref.read(itemProvider.notifier).deleteItem(itemDetails.id);
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
